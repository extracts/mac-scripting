-- Keypoints Scripting Lib
-- version 1.0

-- by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de

-- An AppleScriptObjC-based script library which contains useful AppleScriptObjC methods
-- that can be used when scripting Keypoints (keypointsapp.net) or other Mac apps.

-- Credits: Some methods were taken (or modified after) sample methods from the
-- eBook "Everyday AppleScriptObjC" which is a great introduction to AppleScriptObjC
-- and which shows how to write AppleScriptObjC-based script libraries.
-- see http://www.macosxautomation.com/applescript/apps/everyday_book.html

use framework "/System/Library/Frameworks/AppKit.framework"
use framework "/System/Library/Frameworks/Quartz.framework"
use scripting additions

-- STRINGS

-- Searches the given input string using the given search pattern (which is treated as regular expression). Returns the substring matched by the entire search pattern, or an empty string (in case nothing was matched).
-- @param someText The input string on which the search shall be performed
-- @param searchPattern The search string as an ICU-compatible regular expression
on regexMatch(someText, searchPattern)
	set theString to current application's NSString's stringWithString:someText
	set theRange to theString's rangeOfString:searchPattern options:(current application's NSRegularExpressionSearch)
	if location of theRange = current application's NSNotFound then
		set foundString to ""
	else
		set foundString to theString's substringWithRange:theRange
	end if
	return foundString as text
end regexMatch

-- Performs a regex search/replace action on the given input string. The given search & replace patterns are treated as regular expressions.
-- @param someText The input string on which the search/replace shall be performed
-- @param searchPattern The search string as an ICU-compatible regular expression
-- @param replacePattern The replace string as an ICU-compatible regular expression
on regexReplace(someText, searchPattern, replacePattern)
	set theString to current application's NSString's stringWithString:someText
	set theString to theString's stringByReplacingOccurrencesOfString:searchPattern withString:replacePattern options:(current application's NSRegularExpressionSearch) range:{location:0, |length|:length of someText}
	return theString as text
end regexReplace

-- Performs a literal search/replace action on the given input string.
-- @param someText The input string on which the search/replace shall be performed
-- @param searchText The search string (treated as a case insensitive query)
-- @param replaceText The replace string
on textReplace(someText, searchText, replaceText)
	set theString to current application's NSMutableString's stringWithString:someText
	set theString to theString's stringByReplacingOccurrencesOfString:searchText withString:replaceText options:(current application's NSCaseInsensitiveSearch) range:{location:0, |length|:length of someText}
	return theString as text
end textReplace

-- Splits the given input string on the provided delimiter string.
-- @param someText The input string which shall be split into substrings
-- @param splitDelim The delimiter string used to split the input string
on splitText(someText, splitDelim)
	set theString to current application's NSString's stringWithString:someText
	set theArray to theString's componentsSeparatedByString:splitDelim
	return theArray as list
end splitText


-- STRINGS (FILE PATHS/NAMES)

-- Interprets the given string as file path or file name and returns its file extension,
-- if there's any. Otherwise an empty string is returned.
on fileExtension(thePath)
	set theString to current application's NSString's stringWithString:thePath
	set theExtension to theString's pathExtension
	return theExtension as text
end fileExtension


-- LISTS / ARRAYS

-- Returns the index of the given item in the given list. Returns 0 if the item is not contained in the list.
on indexOf:anItem inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theIndex to theArray's indexOfObject:anItem
	if theIndex = current application's NSNotFound then
		return 0
	else
		return (theIndex + 1) -- we add 1 since Cocoa uses zero-based indexes
	end if
end indexOf:inList:

-- Returns a list containing the results of invoking valueForKey: using the given key on each of the given list’s items.
on valueForKey:theKey inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theResult to theArray's valueForKey:theKey
	return theResult as list
end valueForKey:inList:

-- Returns a list containing the results of invoking valueForKeyPath: using the given key path on each of the given list’s items.
on valueForKeyPath:theKeyPath inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theResult to theArray's valueForKeyPath:theKeyPath
	return theResult as list
end valueForKeyPath:inList:

-- Sorts the given list of items.
on sortList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theArray to theArray's sortedArrayUsingSelector:"compare:"
	return theArray as list
end sortList:

-- Sorts the given list of items by the given key, in ascending (true) or descending (false) order.
-- 'selectorName' must be one of these: "compare:", or alternatively in case of string values being compared: "caseInsensitiveCompare:", "localizedCaseInsensitiveCompare:", "localizedCompare:", "localizedStandardCompare:"
on sortList:theList byKey:theKey inAscendingOrder:sortAscending usingSelector:selectorName
	set theArray to current application's NSArray's arrayWithArray:theList
	set theSortDescriptor to current application's NSSortDescriptor's sortDescriptorWithKey:theKey ascending:sortAscending selector:selectorName
	set theDescriptors to current application's NSArray's arrayWithObject:theSortDescriptor
	set theArray to theArray's sortedArrayUsingDescriptors:theDescriptors
	return theArray as list
end sortList:byKey:inAscendingOrder:usingSelector:

-- Sorts the given list of strings the same way as the Finder does, taking into account numerals in names.
on sortStringList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theArray to theArray's sortedArrayUsingSelector:"localizedStandardCompare:"
	return theArray as list
end sortStringList:

-- For the given list, this returns a record with collection statistics (sum, max, min, avg) and unique values.
on analyzeList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theCount to (theArray's valueForKeyPath:"@count.self") as real
	set theSum to (theArray's valueForKeyPath:"@sum.self") as real
	set theMax to (theArray's valueForKeyPath:"@max.self") as real
	set theMin to (theArray's valueForKeyPath:"@min.self") as real
	set theAvg to (theArray's valueForKeyPath:"@avg.self") as real
	set uniqueValues to (theArray's valueForKeyPath:"@distinctUnionOfObjects.self") as list
	return {theCount:theCount, theSum:theSum, theMax:theMax, theMin:theMin, theAvg:theAvg, uniqueValues:uniqueValues}
end analyzeList:

-- Combines all items of the sublists in the given list into a single list.
on unionOfListsInList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set unionOfArrays to (theArray's valueForKeyPath:"@unionOfArrays.self")
	return unionOfArrays as list
end unionOfListsInList:

-- Combines all unique items of the sublists in the given list into a single list.
on distinctUnionOfListsInList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set distinctUnionOfArrays to (theArray's valueForKeyPath:"@distinctUnionOfArrays.self")
	return distinctUnionOfArrays as list
end distinctUnionOfListsInList:


-- RECORDS / DICTIONARIES

-- Creates and returns a new record from the given list of labels and values.
on recordFromLabels:labels andValues:values
	set theResult to current application's NSDictionary's dictionaryWithObjects:values forKeys:labels
	return theResult as record
end recordFromLabels:andValues:

-- Returns the value of the given key in the given record, or 'missing value' if the key was not found.
-- NOTE: This currently only works with text (NSString) values.
on valueForKey:theKey inRecord:theRecord
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set theResult to theDict's valueForKey:theKey
	if theResult = missing value then
		return missing value
	else
		return theResult as text -- TODO: inspect the class and coerce appropriately?
	end if
end valueForKey:inRecord:

-- Sorts the given record by its values in ascending order. Returns a list of the record’s labels, in the order they would be in if the record were sorted by its values.
-- 'selectorName' must be one of these: "compare:", or alternatively in case of string values being compared: "caseInsensitiveCompare:", "localizedCaseInsensitiveCompare:", "localizedCompare:", "localizedStandardCompare:"
on sortRecordByValue:theRecord usingSelector:selectorName
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set theArray to theDict's keysSortedByValueUsingSelector:selectorName
	return theArray as list
end sortRecordByValue:usingSelector:

-- Saves the given record to a plist file at the given POSIX path.
on saveRecord:theRecord toPlistAt:POSIXPath
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	theDict's writeToFile:thePath atomically:true
	log result -- so we can see if it saved
end saveRecord:toPlistAt:

-- Returns the contents of the plist file at the given POSIX path. Note that the plist's root-level item must be a record (aka NSDictionary).
on readRecordPlistAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theDict to current application's NSDictionary's dictionaryWithContentsOfFile:thePath
	return theDict as record
end readRecordPlistAt:


-- XML

-- Returns a list of string values for all nodes matching the given XPath in the XML file at the given POSIX path.
on valueListForXPath:theXPath fromXMLAt:POSIXPath
	-- TODO: proper error handling
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set theXMLDoc to current application's NSXMLDocument's alloc()'s initWithContentsOfURL:theURL options:0 |error|:(missing value)
	set theNodeValues to theXMLDoc's nodesForXPath:theXPath |error|:(missing value)
	set theStringValues to theNodeValues's valueForKey:"stringValue"
	return theStringValues as list
end valueListForXPath:fromXMLAt:


-- PDF

-- Returns a record of PDF document metadata for the PDF file at the given POSIX path.
on documentAttributesForPDFAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set thePDFDoc to current application's PDFDocument's alloc()'s initWithURL:theURL
	set theDocumentAttributes to thePDFDoc's documentAttributes
	return theDocumentAttributes as record
end documentAttributesForPDFAt:

-- Returns the value of the given document attribute for the PDF file at the given POSIX path.
on documentAttributeForKey:theKey fromPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	-- NOTE: valueForKey:inRecord: currently only supports text (NSString) values
	set theValue to my valueForKey:theKey inRecord:theDocumentAttributes
	if theValue = missing value then
		return missing value
	else
		return theValue
	end if
end documentAttributeForKey:fromPDFAt:

-- Returns the value of the "Title" document attribute (as text) for the PDF file at the given POSIX path.
on titleDocumentAttributeForPDFAt:POSIXPath
	set theTitle to my documentAttributeForKey:"Title" fromPDFAt:POSIXPath
	return theTitle as text
end titleDocumentAttributeForPDFAt:

-- Returns the value of the "Author" document attribute (as text) for the PDF file at the given POSIX path.
on authorDocumentAttributeForPDFAt:POSIXPath
	set theAuthor to my documentAttributeForKey:"Author" fromPDFAt:POSIXPath
	return theAuthor as text
end authorDocumentAttributeForPDFAt:

-- Returns the value of the "Subject" document attribute (as text) for the PDF file at the given POSIX path.
on subjectDocumentAttributeForPDFAt:POSIXPath
	set theSubject to my documentAttributeForKey:"Subject" fromPDFAt:POSIXPath
	return theSubject as text
end subjectDocumentAttributeForPDFAt:

-- Returns the value of the "Keywords" document attribute (as a list) for the PDF file at the given POSIX path.
on keywordsDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theKeywords to Keywords of theDocumentAttributes -- returns an error if key is not found
		return theKeywords
	on error
		return missing value
	end try
end keywordsDocumentAttributeForPDFAt:

-- Returns the value of the "Creator" document attribute (as text) for the PDF file at the given POSIX path.
on creatorDocumentAttributeForPDFAt:POSIXPath
	set theCreator to my documentAttributeForKey:"Creator" fromPDFAt:POSIXPath
	return theCreator as text
end creatorDocumentAttributeForPDFAt:

-- Returns the value of the "Producer" document attribute (as text) for the PDF file at the given POSIX path.
on producerDocumentAttributeForPDFAt:POSIXPath
	set theProducer to my documentAttributeForKey:"Producer" fromPDFAt:POSIXPath
	return theProducer as text
end producerDocumentAttributeForPDFAt:

-- Returns the value of the "ModDate" document attribute (as date) for the PDF file at the given POSIX path.
-- NOTE: this doesn't yet return a proper AppleScript date
on modificationDateDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theModDate to ModDate of theDocumentAttributes -- returns an error if key is not found
		return theModDate -- TODO: how to convert «class ocid» into an AppleScript date?
	on error
		return missing value
	end try
end modificationDateDocumentAttributeForPDFAt:

-- Returns the value of the "CreationDate" document attribute (as date) for the PDF file at the given POSIX path.
-- NOTE: this doesn't yet return a proper AppleScript date
on creationDateDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theCreationDate to CreationDate of theDocumentAttributes -- returns an error if key is not found
		return theCreationDate -- TODO: how to convert «class ocid» into an AppleScript date?
	on error
		return missing value
	end try
end creationDateDocumentAttributeForPDFAt:

-- Sets the given record as PDF document attributes for the PDF file at the given POSIX path.
-- Valid record labels: Title, Author, Subject, Keywords, Creator, Producer, ModDate, CreationDate
on setDocumentAttributes:attributeRecord forPDFAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set thePDFDoc to current application's PDFDocument's alloc()'s initWithURL:theURL
	set theDict to current application's NSDictionary's dictionaryWithDictionary:attributeRecord
	thePDFDoc's setDocumentAttributes:theDict
	return thePDFDoc's writeToFile:thePath
end setDocumentAttributes:forPDFAt:

-- Sets the given value as a document attribute with the given key for the PDF file at the given POSIX path.
on setDocumentAttributeValue:theValue forKey:theKey fromPDFAt:POSIXPath
	-- TODO: this loads the PDF twice (once for reading and once for writing)
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	set theDict to current application's NSMutableDictionary's dictionaryWithDictionary:theDocumentAttributes
	theDict's setValue:theValue forKey:theKey
	return my setDocumentAttributes:(theDict as record) forPDFAt:POSIXPath
end setDocumentAttributeValue:forKey:fromPDFAt:

-- Sets the value of the "Title" document attribute for the PDF file at the given POSIX path.
on setTitleDocumentAttribute:theTitle forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theTitle forKey:"Title" fromPDFAt:POSIXPath
end setTitleDocumentAttribute:forPDFAt:

-- Sets the value of the "Author" document attribute for the PDF file at the given POSIX path.
on setAuthorDocumentAttribute:theAuthor forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theAuthor forKey:"Author" fromPDFAt:POSIXPath
end setAuthorDocumentAttribute:forPDFAt:

-- Sets the value of the "Subject" document attribute for the PDF file at the given POSIX path.
on setSubjectDocumentAttribute:theSubject forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theSubject forKey:"Subject" fromPDFAt:POSIXPath
end setSubjectDocumentAttribute:forPDFAt:

-- Sets the value of the "Keywords" document attribute for the PDF file at the given POSIX path.
on setKeywordsDocumentAttribute:theKeywords forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theKeywords forKey:"Keywords" fromPDFAt:POSIXPath
end setKeywordsDocumentAttribute:forPDFAt:

-- Sets the value of the "Creator" document attribute for the PDF file at the given POSIX path.
on setCreatorDocumentAttribute:theCreator forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theCreator forKey:"Creator" fromPDFAt:POSIXPath
end setCreatorDocumentAttribute:forPDFAt:

-- Sets the value of the "Producer" document attribute for the PDF file at the given POSIX path.
-- NOTE: Producer will be always set to "Mac OS X 10.9.2 Quartz PDFContext"
(*
on setProducerDocumentAttribute:theProducer forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theProducer forKey:"Producer" fromPDFAt:POSIXPath
end setProducerDocumentAttribute:forPDFAt:
*)


-- Finder tags

-- Credits: Tag-related methods by Shane Stanley, see http://macscripter.net/viewtopic.php?id=41892

-- Returns the tags of the file at the given POSIX path.
on returnTagsFor:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	set {theResult, theTags} to theURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
	if theTags = missing value then return {} -- when there are none, it returns missing value
	return theTags as list
end returnTagsFor:

-- Replaces the tags of the file at the given POSIX path with the given tags.
-- @param tagList The full list of tags to be set for the specified file; may be empty
on setTags:tagList forPath:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	theURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
end setTags:forPath:

-- Adds the given tags to the tags assigned to the file at the given POSIX path.
-- @param tagList The list of tags to be added for the specified file; may be empty
on addTags:tagList forPath:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	-- get existing tags
	set {theResult, theTags} to theURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
	if theTags ≠ missing value then -- add new tags
		set tagList to (theTags as list) & tagList
		set tagList to (current application's NSOrderedSet's orderedSetWithArray:tagList)'s allObjects() -- delete any duplicates
	end if
	theURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
end addTags:forPath:


-- ----------------------------------------------------------------------------


-- AppleScript methods

--- Creates a new folder of the given name at the given folder location (specified as POSIX path),
--- and returns the newly created (or existing) folder's POSIX path.
on createNewFolder(aFolderPOSIXPath, aFolderName)
	set aFolderName to cleanFolderName(aFolderName)
	set containerFolder to POSIX file aFolderPOSIXPath as alias
	tell application "Finder"
		set newFolderPath to (folder containerFolder as string) & aFolderName
		if not (exists folder newFolderPath) then
			set newFolderPath to (make new folder at folder containerFolder with properties {name:aFolderName}) as string
		end if
		return POSIX path of (alias newFolderPath)
	end tell
end createNewFolder

-- Removes unwanted or disallowed characters from a string that's to be used as a folder name
on cleanFolderName(aFolderName)
	set aFolderName to my textReplace(aFolderName, ":", " - ")
	set aFolderName to my textReplace(aFolderName, "/", " - ")
	set aFolderName to my textReplace(aFolderName, "  ", " ") -- removes double whitespace (a regex replace would be better)
	return aFolderName
end cleanFolderName

-- Deletes all items contained in the given folder. Use with care.
on deleteFolderContents(folderAlias)
	tell application "Finder"
		set folderContents to items of folderAlias
		if folderContents is not {} then
			delete folderContents
		end if
	end tell
end deleteFolderContents

-- Returns `true` if the file (or folder) at the given POSIX path exists, otherwise returns `false`.
on fileExistsAtFilePath(aFilePOSIXPath)
	if aFilePOSIXPath is missing value or aFilePOSIXPath is "" then return false
	set theFile to POSIX file aFilePOSIXPath
	tell application "Finder"
		set fileExists to (exists theFile)
	end tell
	return fileExists
end fileExistsAtFilePath

-- Returns the file name of the file at the given POSIX file path. The file at the given path must exist.
on fileNameFromFilePath(aFilePOSIXPath)
	set aFile to (POSIX file aFilePOSIXPath) as alias
	set fileName to missing value
	tell application "Finder"
		if exists (aFile as string) then
			set fileName to name of aFile
		end if
	end tell
	return fileName
end fileNameFromFilePath

--- Saves a text file to the given file. Note that this will replace any existing file content.
on writeTextToFile(aFile, theText)
	set aFileRef to open for access aFile with write permission
	set eof aFileRef to 0
	write theText to aFileRef as «class utf8»
	close access aFileRef
end writeTextToFile

--- Reads the contents from the given file.
on readFromFile(aFile)
	set aFileRef to open for access aFile without write permission
	set fileContents to read aFileRef as «class utf8»
	close access aFileRef
	return fileContents
end readFromFile

-- Generates a unique file path (which doesn't yet exist on disk) from a given file path.
on uniquifyFilePath(filePath)
	set i to 0
	set done to false
	tell application "Finder"
		set newFilePath to filePath
		repeat until done is true
			if exists newFilePath then
				set i to i + 1
				set fileExtension to name extension of (filePath as alias)
				set newFilePath to my regexReplace(filePath, "\\." & fileExtension & "$", "-" & i & "." & fileExtension)
			else
				set done to true
			end if
		end repeat
	end tell
	return newFilePath
end uniquifyFilePath

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

-- Displays an error alert.
on displayError(errorMessage, errorDetails, dismissAfter, cancelSriptExecution)
	display alert errorMessage message errorDetails as critical buttons {"OK"} default button "OK" giving up after dismissAfter
	if cancelSriptExecution then
		error number -128
	end if
end displayError

-- Initializes progress reporting.
on setupProgress(progressTitle)
	set progress description to progressTitle
	set progress additional description to "Preparing…"
	set progress total steps to -1
end setupProgress

-- Defines the total number of steps for the progress reporting.
on setTotalStepsForProgress(totalSteps)
	set progress total steps to totalSteps
end setTotalStepsForProgress

-- Updates the progress subtitle and number of completed steps for the progress reporting.
on updateProgress(completedSteps, progressSubtitle)
	set progress additional description to progressSubtitle
	set progress completed steps to completedSteps
end updateProgress
