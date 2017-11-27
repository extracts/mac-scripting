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
-- * annotation color

-- In addition, these publication properties are also transferred:
-- * formatted reference
-- * cite key
-- * keywords
-- * color label
-- * flagged status
-- * "papers://…" link
-- * BibTeX metadata

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

-- Specifies whether the publication's flagged status shall be exported to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, and if the publication was flagged in your Papers library, this script
-- will mark the corresponding index entry for the publication's primary PDF as flagged. Note that
-- this script won't flag the publication's group folder since this would flag all contained items.
property transferPapersFlag : true

-- Specifies whether the publication's keywords shall be transferred to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, this script will use the publication's keywords to set the tags of the
-- group & PDF index entry that are created in DEVONthink Pro for the publication.
property transferPapersKeywords : true

-- Specifies whether the publication's BibTeX metadata shall be transferred to DEVONthink Pro
-- (`true`) or not (`false`). If `true`, this script will add the publication's BibTeX metadata to the
-- Spotlight comment field of the group that's created in DEVONthink Pro for the publication. Note
-- that this script won't set the Spotlight comment field of the PDF index entry since this would cause
-- DEVONthink Pro to also set the Spotlight comment of the target PDF file accordingly (which would
-- overwrite any existing comments).
property transferPapersBibTeX : true

-- Specifies whether the publication's or annotation's color label shall be transferred to DEVONthink
-- Pro (`true`) or not (`false`). If `true`, this script will mark the records created in DEVONthink
-- Pro with an appropriate color label.
property transferPapersLabel : true

-- Specifies whether the publication's "papers://…" link shall be exported to DEVONthink Pro (`true`)
-- or not (`false`). If `true`, the "papers://…" link will be written to the "URL" field of all records
-- created in DEVONthink Pro.
property transferPapersLink : true

-- Specifies whether the publication's or annotation's creation date shall be exported to DEVONthink
-- Pro (`true`) or not (`false`). If `true`, the creation date will be written to the "creation date"
-- field of all groups and notes created in DEVONthink Pro. Note that this script won't touch the
-- creation date of the created PDF index entry (for which DEVONthink displays the file's creation date).
property transferPapersCreationDate : true

-- ----------- usually, you don't need to edit anything below this line -----------

property exportedAnnotationsCount : 0

use KeypointsLib : script "KeypointsScriptingLib"
use scripting additions

-- TODO: optionally transfer manual collections as tags
-- TODO: offer an option to put the publication's formatted reference in the Spotlight comments instead


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
		set exportedAnnotationsCount to 0
		
		repeat with i from 1 to pubCount
			set aPub to item i of pdfPubs
			
			-- gather info for this publication
			set {pubRef, pubKey, pubTitle, pubLink, pubCreationDate} to {formatted reference, citekey, title, item url, creation date} of aPub
			set pubKeywords to name of every keyword item of aPub
			
			KeypointsLib's updateProgress(i, "Exporting publication " & i & " of " & pubCount & " (\"" & pubTitle & "\").")
			
			-- get all notes & highlight annotations for this publication
			set pubAnnotations to every annotation item of primary file item of aPub
			
			if transferPapersPDF or pubAnnotations is not {} then
				-- create a subfolder in DEVONthink (named like "<CITEKEY> - <TITLE>")
				set folderName to pubKey & " - " & pubTitle
				set pubBibTeX to bibtex string of aPub
				set folderLocation to my createDTFolder(dtContainer, folderName, pubLink, pubCreationDate, pubKeywords, pubBibTeX)
				my transferPapersPublicationColor(folderLocation, aPub)
				
				if folderLocation is not missing value then
					-- index PDF file
					if transferPapersPDF then
						set pdfFile to primary file item of aPub
						set pdfPath to full path of pdfFile
						set isFlagged to flagged of aPub
						set indexRecord to my createDTIndexRecord(folderLocation, pdfPath, folderName, pubLink, pubKeywords, isFlagged)
						my transferPapersPublicationColor(indexRecord, aPub)
					end if
					
					-- export annotations
					my exportAnnotationsToDEVONthink(folderLocation, pubAnnotations, pubRef, pubKey, pubLink)
				else
					KeypointsLib's logToSystemConsole(name of me, "Couldn't export publication \"" & pubTitle & "\" since its group folder could not be created in DEVONthink.")
				end if
			end if
		end repeat
	end tell
	
	tell application id "DNtp"
		activate
		display dialog "Imported publications: " & pubCount & linefeed & "Imported annotations: " & exportedAnnotationsCount ¬
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


-- Creates a new (rich text) record in DEVONthink for each of the given Papers note or highlight annotations.
on exportAnnotationsToDEVONthink(folderLocation, pubAnnotations, pubRef, pubKey, pubLink)
	if folderLocation is missing value or pubAnnotations is missing value then return
	
	tell application id "com.mekentosj.papers3"
		repeat with anAnnotation in pubAnnotations
			if resource type of anAnnotation is not "Ink" then -- ink annotations aren't supported by this script
				set recordCreationDate to creation date of anAnnotation
				
				-- individual records have titles like "<CITEKEY> - <NOTE SUMMARY>"
				set annotationSummary to content summary of anAnnotation
				set recordName to pubKey & " - " & annotationSummary
				
				-- assemble formatted text for this note
				-- TODO: use a template mechanism for note formatting
				set recordContents to pubRef & linefeed & linefeed ¬
					& "{" & pubKey & "}" & linefeed & linefeed ¬
					& annotationSummary & linefeed & linefeed
				
				-- create a record for this note in DEVONthink
				set dtRecord to my createDTRecord(folderLocation, recordName, pubLink, recordContents, recordCreationDate)
				if dtRecord is not missing value then set exportedAnnotationsCount to exportedAnnotationsCount + 1
				
				-- set color label of DEVONthink record
				my transferPapersAnnotationColor(dtRecord, anAnnotation)
			end if
		end repeat
	end tell
end exportAnnotationsToDEVONthink


-- Sets the color label of the given DEVONthink record to the publication color label
-- of the given Papers publication
on transferPapersPublicationColor(dtRecord, papersPublication)
	if dtRecord is missing value or papersPublication is missing value then return
	
	set pubJSON to my jsonStringForPapersItem(papersPublication)
	
	if transferPapersLabel and pubJSON is not missing value then -- set color label
		set papersColorIndex to KeypointsLib's regexMatch(pubJSON, "(?<=" & linefeed & "  \"label\": ).+(?=,)")
		if papersColorIndex > 0 then
			set dtLabel to my dtLabelForPapersPublicationColor(papersColorIndex)
			if dtLabel > 0 then
				tell application id "DNtp" to set label of dtRecord to dtLabel
			end if
		end if
	end if
end transferPapersPublicationColor


-- Sets the color label of the given DEVONthink record to the annotation color
-- of the given Papers note or highlight annotation
on transferPapersAnnotationColor(dtRecord, papersAnnotation)
	if dtRecord is missing value or papersAnnotation is missing value then return
	
	set noteJSON to my jsonStringForPapersItem(papersAnnotation)
	
	if transferPapersLabel and noteJSON is not missing value then -- set color label
		set papersColorIndex to KeypointsLib's regexMatch(noteJSON, "(?<=" & linefeed & "  \"color\": ).+(?=,)")
		if papersColorIndex > 0 then
			set dtLabel to my dtLabelForPapersAnnotationColor(papersColorIndex)
			if dtLabel > 0 then
				tell application id "DNtp" to set label of dtRecord to dtLabel
			end if
		end if
	end if
end transferPapersAnnotationColor


-- Returns the contents of the `json string` property for the given Papers item.
on jsonStringForPapersItem(papersItem)
	set jsonString to missing value
	try -- getting the json string may cause a -10000 error
		tell application id "com.mekentosj.papers3" to set jsonString to json string of papersItem
	on error errorText number errorNumber
		if errorNumber is not -128 then
			KeypointsLib's logToSystemConsole(name of me, "Couldn't fetch 'json string' property for papers item of type \"" & (class of papersItem) & "\"." & linefeed & "Error: " & errorText & " (" & errorNumber & ")")
		end if
	end try
	return jsonString
end jsonStringForPapersItem


-- Returns the index of the DEVONthink color label corresponding to the given Papers publication color index.
on dtLabelForPapersPublicationColor(papersColorIndex)
	-- Papers publication color index (name) -> DEVONthink label index (name)
	-- 0 (none)		-> 0 (none)
	-- 1 (red)		-> 1 (red)
	-- 2 (orange)		-> 5 (orange)
	-- 3 (yellow)		-> 4 (yellow)
	-- 4 (green)		-> 2 (green)
	-- 5 (blue)		-> 3 (blue)
	-- 6 (purple)		-> 7 (pink) // the "purple" Papers color label looks more like pink
	-- 7 (light gray)		-> 6 (purple) // improper mapping!
	set dtLabels to {1, 5, 4, 2, 3, 7, 6}
	
	if papersColorIndex ≥ 1 and papersColorIndex ≤ 7 then
		return item papersColorIndex of dtLabels
	else
		return 0
	end if
end dtLabelForPapersPublicationColor


-- Returns the index of the DEVONthink color label corresponding to the given Papers annotation color index.
on dtLabelForPapersAnnotationColor(papersColorIndex)
	-- Papers annotation color index (name) -> DEVONthink label index (name)
	-- used for highlight annotations:
	-- 0 (none)		-> 0 (none)
	-- 1 (yellow)		-> 4 (yellow)
	-- 2 (blue)		-> 3 (blue)
	-- 3 (green)		-> 2 (green)
	-- 4 (pink)		-> 7 (pink)
	-- 5 (purple)		-> 6 (purple)
	-- 6 (light gray)	-> 5 (orange) // improper mapping!
	
	-- only used for ink annotations:
	-- 7 (orange)	-> 5 (orange)
	-- 8 (red)		-> 1 (red)
	-- 9 (black)		-> 0 (none)
	set dtLabels to {4, 3, 2, 7, 6, 5, 5, 1, 0}
	
	if papersColorIndex ≥ 1 and papersColorIndex ≤ 9 then
		return item papersColorIndex of dtLabels
	else
		return 0
	end if
end dtLabelForPapersAnnotationColor


-- Finds the DEVONthink folder for this publication, or creates it if it doesn't exist.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on createDTFolder(dtContainer, folderName, folderURL, folderCreationDate, folderTags, folderComment)
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
		
		if transferPapersBibTeX and folderComment is not "" and folderComment is not missing value then
			set comment of dtLocation to folderComment
		end if
		
		return dtLocation
	end tell
end createDTFolder


-- Creates a new (rich text) record in DEVONthink with the given text and returns it.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on createDTRecord(folderLocation, recordName, recordURL, recordText, recordCreationDate)
	tell application id "DNtp"
		set newRecordData to {type:rtf, rich text:recordText, name:recordName}
		
		if transferPapersLink and recordURL is not "" then
			set newRecordData to newRecordData & {URL:recordURL}
		end if
		
		if transferPapersCreationDate and recordCreationDate is not missing value then
			set newRecordData to newRecordData & {creation date:recordCreationDate}
		end if
		
		set newRecord to create record with newRecordData in folderLocation
		set aRecord to my deduplicatedDTRecord(newRecord)
		return aRecord
	end tell
end createDTRecord


-- Creates an indexed object for the given file path in DEVONthink.
on createDTIndexRecord(folderLocation, filePath, recordName, recordURL, recordTags, isFlagged)
	tell application id "DNtp"
		set indexRecord to indicate filePath to folderLocation
		
		set aliases of indexRecord to recordName
		
		if transferPapersFlag and isFlagged then
			set state of indexRecord to isFlagged
		end if
		
		if transferPapersLink and recordURL is not "" then
			set URL of indexRecord to recordURL
		end if
		
		if transferPapersKeywords and recordTags is not {} then
			set tags of indexRecord to (tags of indexRecord) & recordTags
		end if
		
		set aRecord to my deduplicatedDTRecord(indexRecord)
		return aRecord
	end tell
end createDTIndexRecord


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
