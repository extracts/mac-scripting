-- Update group publications from attachment name
-- version 1.0, licensed under the MIT license

-- by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

-- This sample script for Bookends 13.2 or greater shows how to extract information from attachment
-- file names, and set publication metadata accordingly:

-- For all publications contained in the group chosen from your frontmost Bookends library window,
-- this script will take the first attachment of each publication, extract the part of the attachment
-- name that's enclosed with parentheses, and add all of its words as individual publication keywords.

-- As an example, consider a PDF file name for an academic paper (e.g.: http://dx.doi.org/10.1038/npp.2015.181)
-- where the user has added his own keywords within parentheses to the file name, like this:
-- 
--   Chen & Baram '16 (dev stress cognitive review).pdf
-- 
-- This script will extract those keywords ("dev", "stress", "cognitive", and "review") and set the
-- publication's "Keywords" field accordingly.

-- To adopt this script to your needs, you'd need to set the value of the `substringRegex` property
-- to a search pattern that matches your data in the attachment file name. Also, you may need to
-- edit the value of the `delimiter` property. And in the main script handler (`on run`), instead of
-- calling `setKeywordsForPublication()`, perform your own action to handle the extracted data.

-- This script requires macOS 10.10 (Yosemite) or greater, and Bookends 13.2 or greater.

-- TODO: display progress info

-- ----------- you may edit the values of the properties below -------------------

-- The group name whose publications & attachments will be processed by this script.
-- Note that you don't need to specify a group name here, since the script will ask you
-- to choose a group name from a list of all user-created groups.
property groupName : ""

-- The search pattern (as an ICU-compatible regular expression) which matches the substring
-- that shall be extracted from attachment file names.
-- The given pattern matches everything between the first pair of parentheses.
property substringRegex : "(?<=\\().+?(?=\\))"

-- Specifies the delimiter that will be used to split the matched substring into individual items.
-- Specify an empty string to avoid any splitting.
property delimiter : " "

-- Specifies whether the extracted keywords will replace the current contents of the publication's
-- "Keywords" field (`true`), or if the extracted keywords will be appended to any existing keywords
-- (`false`).
property replaceExistingKeywords : false

-- Specifies the help messages that are displayed when the script is run
property helpMessage : "For all publications in a group, this script will extract all words within the first pair of parens from the first attachment name"
property additionalInfoAppend : ", and append them to the \"Keywords\" field." -- if replaceExistingKeywords is false
property additionalInfoReplace : ", and set the \"Keywords\" field accordingly." -- if replaceExistingKeywords is true

-- ----------- usually, you don't need to edit anything below this line -----------

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- main script handler
on run
	set chosenGroupNames to my chooseGroupName()
	if chosenGroupNames is false then error number -128 -- abort if user pressed "Cancel"
	set groupName to first item of chosenGroupNames
	
	set groupPubs to my publicationsForGroupByName(groupName)
	if groupPubs is {} then
		set theMessage to "The selected group (\"" & groupName & "\") contains no publications."
		set additionalInfo to "Please select a group containing the publications you'd like to process, then run this script again."
		my displayMessage("No publications found!", theMessage, additionalInfo, "Try again", "com.sonnysoftware.bookends", 2)
		run -- run main script handler again
	end if
	
	repeat with aPub in groupPubs
		set attachmentName to my firstAttachmentNameFromPublication(aPub)
		if attachmentName is not "" then
			set keywordsList to my substringsFromString(attachmentName, substringRegex, delimiter)
			if keywordsList is not {} then
				set success to my setKeywordsForPublication(aPub, keywordsList)
			end if
		end if
	end repeat
end run

-- ------------------------------------------------------------------------------------

-- Presents a dialog with a list of user-created groups from the frontmost Bookends
-- library window, and let's you choose one of them for further processing. Returns
-- the chosen group name as a list, or `false` if the "Cancel" button was pressed.
on chooseGroupName()
	tell application "Bookends"
		tell front library window
			set userGroups to name of every group item
			
			set additionalInfo to additionalInfoAppend
			if replaceExistingKeywords then
				set additionalInfo to additionalInfoReplace
			end if
			set theMessage to helpMessage & additionalInfo & linefeed & linefeed & "Select group:"
			
			set chosenGroupNames to choose from list userGroups with title "Please choose a group…" with prompt theMessage default items {groupName} OK button name "Run" cancel button name "Cancel" without multiple selections allowed and empty selection allowed
			return chosenGroupNames
		end tell
	end tell
end chooseGroupName

-- Displays the given message & additional info in a dialog inside the application specified
-- by the given bundle identifier. If there's no application with that bundle identifier, the
-- message will be displayed within the current application.
on displayMessage(theTitle, theMessage, additionalInfo, buttonName, appBundleID, iconID)
	if theTitle is missing value or theTitle is "" then set theTitle to "About this script"
	if theMessage is missing value then set theMessage to ""
	if buttonName is missing value or buttonName is "" then set buttonName to "OK"
	if iconID is not in {0, 1, 2} then set iconID to 1 -- 0: stop, 1: note, 2: caution
	
	if additionalInfo is not missing value and additionalInfo is not "" then
		set separator to ""
		if theMessage is not "" then
			set separator to linefeed & linefeed
		end if
		set theMessage to theMessage & separator & additionalInfo
	end if
	
	try
		tell application id appBundleID
			display dialog theMessage with title theTitle with icon iconID buttons {buttonName} default button buttonName
		end tell
	on error
		tell current application
			display dialog theMessage with title theTitle with icon iconID buttons {buttonName} default button buttonName
		end tell
	end try
end displayMessage

-- For the frontmost library window opened in Bookends, returns all publications
-- contained in the group of the given name. Returns an empty list if there's no
-- group with that name, or if the group has no publications.
on publicationsForGroupByName(aGroupName)
	if aGroupName is missing value or aGroupName is "" then return {}
	
	tell application "Bookends"
		tell front library window
			set groupPubs to {}
			set matchingGroups to every group item whose name is aGroupName
			if matchingGroups is not {} then
				set aGroup to first item of matchingGroups
				set groupPubs to publication items of aGroup
			end if
			return groupPubs
		end tell
	end tell
end publicationsForGroupByName

-- For the given Bookends publication, returns the name of its first attachment
-- (if there's any), otherwise returns an empty string.
on firstAttachmentNameFromPublication(aPublication)
	if aPublication is missing value then return ""
	
	tell application "Bookends"
		set pubAttachments to attachment items of aPublication
		if pubAttachments is {} then return ""
		
		set anAttachment to first item of pubAttachments
		set attachmentName to name of anAttachment
		return attachmentName
	end tell
end firstAttachmentNameFromPublication

-- Sets the "Keywords" field of the given Bookends publication to the given
-- list of keywords. Returns true if the keywords could be set successfully,
-- otherwise returns false.
on setKeywordsForPublication(aPublication, keywordsList)
	if aPublication is missing value then return false
	if keywordsList is missing value or keywordsList is {} then return false
	
	set keywordsString to my mergeTextItems(keywordsList, linefeed)
	tell application "Bookends"
		if (not replaceExistingKeywords) then
			set existingKeywords to keywords of aPublication
			if existingKeywords is not "" then
				set keywordsString to existingKeywords & linefeed & keywordsString
			end if
		end if
		set keywords of aPublication to keywordsString
	end tell
	return true
end setKeywordsForPublication

-- Extracts the first substring matched by the Regex given in `searchPattern`
-- from `aString`. If `splitDelim` is empty, returns the matched substring as
-- a list. If `splitDelim` is non-empty, the matched substring will be further
-- split by this delimiter, and the resulting list of items will be returned.
-- Returns an empty list if nothing was matched.
on substringsFromString(aString, searchPattern, splitDelim)
	if aString is missing value or aString is "" then return {}
	if searchPattern is missing value or searchPattern is "" then return {}
	
	set substring to my regexMatch(aString, searchPattern)
	if substring is not "" then
		set substrings to my splitText(substring, splitDelim)
		return substrings
	end if
	return {}
end substringsFromString

-- Merges the given list of text items using the given separator string.
on mergeTextItems(textItemList, aSeparator)
	considering case
		set prevTIDs to text item delimiters of AppleScript
		set text item delimiters of AppleScript to aSeparator
		set mergedText to textItemList as text
		set text item delimiters of AppleScript to prevTIDs
	end considering
	return mergedText
end mergeTextItems

-- ------------------------------------------------------------------------------------

-- NOTE: the below handlers are written in AppleScriptObjC
-- see https://latenightsw.com/adding-applescriptobjc-to-existing-scripts/
use framework "Foundation" -- required for the AppleScriptObjC handlers

-- NOTE: this works around an AppleScriptObjC bug in macOS 10.13.0
-- see http://latenightsw.com/high-sierra-applescriptobjc-bugs/
property NSNotFound : a reference to 9.22337203685477E+18 + 5807

-- Searches the given input string using the given search pattern (which is
-- treated as regular expression). Returns the substring matched by the
-- entire search pattern, or an empty string (in case nothing was matched).
-- @param someText The input string on which the search shall be performed
-- @param searchPattern The search string as an ICU-compatible regular expression
on regexMatch(someText, searchPattern)
	if someText is missing value then return ""
	if searchPattern is missing value then return ""
	
	set theString to current application's NSString's stringWithString:someText
	set theRange to theString's rangeOfString:searchPattern options:(current application's NSRegularExpressionSearch)
	if location of theRange = NSNotFound then
		set foundString to ""
	else
		set foundString to theString's substringWithRange:theRange
	end if
	return foundString as text
end regexMatch

-- Splits the given input string on the provided delimiter string. Returns the
-- input string as list in case the delimiter string wasn't found in the input string.
-- @param someText The input string which shall be split into substrings
-- @param splitDelim The delimiter string used to split the input string
on splitText(someText, splitDelim)
	if someText is missing value or someText is "" then return "" as list
	if splitDelim is missing value then return someText as list
	
	set theString to current application's NSString's stringWithString:someText
	set theArray to theString's componentsSeparatedByString:splitDelim
	return theArray as list
end splitText
