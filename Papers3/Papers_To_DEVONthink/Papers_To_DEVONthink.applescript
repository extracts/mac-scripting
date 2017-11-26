-- Papers to DEVONthink
-- version 1.0, licensed under the MIT license

-- by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de

-- Exports all notes & highlight annotations of all publications selected in your
-- Papers 3 library to DEVONthink Pro.

-- If not disabled within the script, the publication's primary PDF will be also
-- indexed in DEVONthink Pro.

-- This script requires macOS 10.10 (Yosemite) or greater, the KeypointsScriptingLib v1.2 or
-- greater, Papers 3.4.2 or greater, and DEVONthink Pro 12.9.16 or greater.

-- This export script will transfer the following annotation properties:
-- * logical page number
-- * quoted text
-- * annotation type
-- * creation date
-- * color label

-- In addition, these publication properties are also transferred:
-- * formatted reference
-- * cite key
-- * keywords
-- * "papers://…" link

-- The export of some of these properties can be disabled below. Example note as created by this script:

(*
Krell, A. et al., 2003. The biology and chemistry of land fast ice in the White Sea, Russia–A comparison
of winter and spring conditions. Polar Biology, 26(11), pp.707–719.

{Krell++2003WhiteSea}

p.707: Sea ice therefore probably plays a major role in structuring the White Sea ecosystem, since it
strongly alters the exchange of energy and material between water and atmosphere. -- Highlighted 26.11.2017
*)

-- NOTE: Before executing the app, make sure that your Papers and DEVONthink Pro apps are running,
-- and that you've selected all publications in your Papers library that you'd like to export to
-- DEVONthink Pro. Then run the script to start the export process. For each publication with a PDF,
-- the script will create a group within the database or group you've selected in DEVONthink Pro,
-- and populate it with RTF notes for each of your note or highlight annotations.

-- NOTE: Upon completion, DEVONthink Pro will display a modal dialog reporting how many publications
-- (and annotations) were imported.

-- NOTE: If you again select the same database or group in DEVONthink Pro, you can run the
-- script multiple times for the same PDF without creating duplicate notes. This may be useful
-- if you want to add newly added annotations or update the label color for existing ones.
-- However, if a note was modified in DEVONthink Pro, the script will leave it as is and create
-- a duplicate note with the original note contents.


-- ----------- you may edit the values of the properties below ------------------

-- Specifies whether the publication's primary PDF shall be indexed in DEVONthink Pro (`true`)
-- or not (`false`). If `true`, this script will create an index entry for the publication's primary
-- PDF next to any notes & highlight annotations exported by this script.
property transferPapersPDF : true

-- Specifies whether the publication's keywords shall be transferred to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, this script will use the publication's keywords to set the tags of the
-- group that's created in DEVONthink Pro for the publication.
property transferPapersKeywords : true

-- Specifies whether the annotation's color label shall be transferred to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, this script will mark the annotation note that's created in DEVONthink
-- Pro with an appropriate color label.
property transferPapersLabel : true

-- Specifies whether the publication's "papers://…" link shall be exported to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, the "papers://…" link will be written to the "URL" field of all groups
-- and notes created in DEVONthink Pro.
property transferPapersLink : true

-- Specifies whether the publication's or annotation's creation date shall be exported to DEVONthink
-- Pro (`true`) or not (`false`). If `true`, the creation date will be written to the "creation date"
-- field of all groups and notes created in DEVONthink Pro.
property transferPapersCreationDate : true

-- ----------- usually, you don't need to edit anything below this line -----------

use KeypointsLib : script "KeypointsScriptingLib"
use scripting additions

-- TODO: index publication PDF in DT
-- TODO: optionally transfer manual collections as tags


-- adopt this routine to customize
on run
	-- DEVONthink and Papers must be running for this script to work
	if not my checkAppsRunning() then return
	
	KeypointsLib's setupProgress("Exporting selected Papers publications to DEVONthink Pro…")
	
	tell application id "com.mekentosj.papers3"
		-- export the currently selected publications only
		set selectedPubs to selected publications of front library window
		
		-- filter the selection so that it only contains publications with a primary PDF
		set pdfPubs to my pubsWithPDF(selectedPubs)
		set pubCount to count of pdfPubs
		
		-- get current group/window in DEVONthink which should receive the notes
		set {dtContainer, dtWin} to my getDTTargetContainers()
		
		KeypointsLib's setTotalStepsForProgress(pubCount)
		set exportedNotesCount to 0
		
		repeat with i from 1 to pubCount
			set aPub to item i of pdfPubs
			
			-- gather info for this publication
			set {pubRef, pubKey, pubTitle, pubLink, pubCreationDate} to {formatted reference, citekey, title, item url, creation date} of aPub
			set pubKeywords to name of every keyword item of aPub
			
			KeypointsLib's updateProgress(i, "Exporting publication " & i & " of " & pubCount & " (\"" & pubTitle & "\").")
			
			-- get all notes & highlight annotations for this publication
			set pubNotes to every annotation item of primary file item of aPub
			
			-- for each publication that has notes, create a subfolder in DEVONthink (named like "<CITEKEY> - <TITLE>")
			if pubNotes is not {} then
				set folderName to pubKey & " - " & pubTitle
				set recordLocation to my createDTFolder(dtContainer, folderName, pubLink, pubCreationDate, pubKeywords)
			end if
			
			repeat with aNote in pubNotes
				if resource type of aNote is not "Ink" then -- ink annotations aren't supported by this script
					set recordCreationDate to creation date of aNote
					
					-- individual records have titles like "<CITEKEY> - <NOTE SUMMARY>"
					set noteSummary to content summary of aNote
					set recordName to pubKey & " - " & noteSummary
					
					-- assemble formatted text for this note
					set recordContents to pubRef & linefeed & linefeed ¬
						& "{" & pubKey & "}" & linefeed & linefeed ¬
						& noteSummary & linefeed & linefeed
					
					-- create a record for this note in DEVONthink
					set dtRecord to my createDTRecord(recordLocation, recordName, pubLink, recordContents, recordCreationDate)
					if dtRecord is not missing value then set exportedNotesCount to exportedNotesCount + 1
					
					-- set color label of DEVONthink record
					my transferPapersNoteColor(dtRecord, aNote)
				end if
			end repeat
		end repeat
	end tell
	
	tell application id "DNtp"
		activate
		display dialog "Imported publications: " & pubCount & linefeed & "Imported annotations: " & exportedNotesCount ¬
			with title "Finished Import From Papers" with icon 2 buttons {"OK"} default button "OK"
	end tell
end run


-- Returns all publications from the given list of publications that have a primary PDF attached.
on pubsWithPDF(pubList)
	tell application id "com.mekentosj.papers3"
		set allPubsWithPDF to {}
		repeat with aPub in pubList
			set pdfFile to primary file item of aPub
			if pdfFile is not missing value then
				copy contents of aPub to end of allPubsWithPDF
			end if
		end repeat
		return allPubsWithPDF
	end tell
end pubsWithPDF


-- Sets the color label of the given DEVONthink record to the annotation color
-- of the given Papers note or highlight annotation
on transferPapersNoteColor(dtRecord, papersNote)
	if dtRecord is missing value or papersNote is missing value then return
	
	try -- getting the json string may cause a -10000 error
		tell application id "com.mekentosj.papers3" to set noteJSON to json string of papersNote
	on error errorText number errorNumber
		if errorNumber is not -128 then
			set noteJSON to missing value
			KeypointsLib's logToSystemConsole(name of me, "Couldn't properly transfer color label for annotation \"" & (name of dtRecord) & "\"." & linefeed & "Error: " & errorText & " (" & errorNumber & ")")
		end if
	end try
	
	if transferPapersLabel and noteJSON is not missing value then -- set color label
		set papersLabel to KeypointsLib's regexMatch(noteJSON, "(?<=" & linefeed & "  \"color\": ).+(?=,)")
		if papersLabel > 0 then
			set dtLabel to my dtLabelForPapersLabel(papersLabel)
			if dtLabel > 0 then
				tell application id "DNtp" to set label of dtRecord to dtLabel
			end if
		end if
	end if
end transferPapersNoteColor


-- Returns the index of the DEVONthink color label corresponding to the given Papers label index.
on dtLabelForPapersLabel(papersLabel)
	-- Papers annotation color index (name) -> DEVONthink label index (name)
	-- used for highlight annotations:
	-- 0 (none)		-> 0 (none)
	-- 1 (yellow)	-> 4 (yellow)
	-- 2 (blue)		-> 3 (blue)
	-- 3 (green)	-> 2 (green)
	-- 4 (pink)		-> 7 (pink)
	-- 5 (purple)	-> 6 (purple)
	-- 6 (light gray)	-> 5 (orange)
	
	-- only used for ink annotations:
	-- 7 (orange)	-> 5 (orange)
	-- 8 (red)		-> 1 (red)
	-- 9 (black)		-> 0 (none)
	set dtLabels to {4, 3, 2, 7, 6, 5, 5, 1, 0}
	
	if papersLabel ≥ 1 and papersLabel ≤ 9 then
		return item papersLabel of dtLabels
	else
		return 0
	end if
end dtLabelForPapersLabel


-- Finds the DEVONthink folder for this publication, or creates it if it doesn't exist.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on createDTFolder(dtContainer, folderName, folderURL, folderCreationDate, folderTags)
	tell application id "DNtp"
		if (count of parents of dtContainer) is 0 then
			set dtLocation to (create location folderName in database of dtContainer)
		else
			set dtLocation to (create location (location of dtContainer & "/" & name of dtContainer & "/" & folderName) in database of dtContainer)
		end if
		
		if transferPapersLink and folderURL is not "" then
			set URL of dtLocation to folderURL
		end if
		
		if transferPapersCreationDate and folderCreationDate is not missing value then
			set creation date of dtLocation to folderCreationDate
		end if
		
		if transferPapersKeywords and folderTags is not {} then
			set tags of dtLocation to (tags of dtLocation) & folderTags -- in case the folder already exists
		end if
		
		return dtLocation
	end tell
end createDTFolder


-- Creates a new (rich text) record in DEVONthink with the given text and returns it.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on createDTRecord(recordLocation, recordName, recordURL, recordText, recordCreationDate)
	tell application id "DNtp"
		set newRecordData to {type:rtf, rich text:recordText, name:recordName}
		
		if transferPapersLink and recordURL is not "" then
			set newRecordData to newRecordData & {URL:recordURL}
		end if
		
		if transferPapersCreationDate and recordCreationDate is not missing value then
			set newRecordData to newRecordData & {creation date:recordCreationDate}
		end if
		
		set newRecord to create record with newRecordData in recordLocation
		set aRecord to my deduplicatedDTRecord(newRecord)
		return aRecord
	end tell
end createDTRecord


-- If the given record duplicates another in its group, discards the given record and
-- returns the existing "duplicate" record, otherwise just returns the given record.
on deduplicatedDTRecord(aRecord)
	tell application id "DNtp"
		set recordDuplicates to duplicates of aRecord
		if recordDuplicates is not {} then
			set recordLocation to location of aRecord
			repeat with aDuplicateRecord in recordDuplicates
				if location of aDuplicateRecord = recordLocation then
					delete record aRecord
					return aDuplicateRecord
				end if
			end repeat
		end if
		return aRecord
	end tell
end deduplicatedDTRecord


-- Checks if DEVONthink Pro and Papers are running.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on checkAppsRunning()
	tell application id "sevs" -- application "System Events"
		if (count of (processes where creator type = "DNtp")) < 1 then
			KeypointsLib's displayError("DEVONthink Pro not running!", "Please open DEVONthink Pro and select a target database or group, then run this script again.", 15, true)
			return false
		end if
		if (count of (processes where bundle identifier starts with "com.mekentosj.papers3")) < 1 then
			KeypointsLib's displayError("Papers 3 not running!", "Please open Papers 3 and select some publication(s), then run this script again.", 15, true)
			return false
		end if
	end tell
	return true
end checkAppsRunning


-- Gets the target window as well as the group currently selected in DEVONthink Pro.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on getDTTargetContainers()
	tell application id "DNtp"
		-- get the current group, if there is one
		set dtGroup to missing value
		with timeout of 1 second
			try
				set dtGroup to current group
			end try
		end timeout
		
		-- else, get the current database, if there is one
		try
			dtGroup
		on error
			set dtGroup to (root of database id 1)
			set dtWin to open window for record dtGroup
			return {dtGroup, dtWin}
		end try
		
		if dtGroup is missing value then
			set dtGroup to (root of database id 1)
			set dtWin to open window for record dtGroup
			return {dtGroup, dtWin}
		end if
		
		-- ensure that a window is open for this group
		set {dtDatabase, dtGroupID} to {database, id} of dtGroup
		set dtWindows to viewer windows where id of its root is dtGroupID and name of its root is name of dtDatabase
		if length of dtWindows < 1 then
			set dtWin to open window for record dtGroup
		else
			set dtWin to first item of dtWindows
		end if
		
		return {dtGroup, dtWin}
	end tell
end getDTTargetContainers
