-- Papers to Bookends
-- version 1.3, licensed under the MIT license

-- by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de

-- Exports all publications selected in your Papers 3 library (incl. its primary PDFs) to Bookends.

-- This script requires macOS 10.10 (Yosemite) or greater, the KeypointsScriptingLib v1.2 or
-- greater, Papers 3.4.2 or greater, and Bookends 12.5.5 or greater.

-- Besides the common publication metadata (supported by the RIS format), this export script will
-- also transfer the following publication properties (if not disabled below):
-- * rating
-- * color label
-- * flagged status
-- * language
-- * edition
-- * citekey
-- * "papers://…" link
-- For the color label and flagged status, the script will add special keywords to the corresponding
-- Bookends publication (these keywords can be customized below).
-- For journal articles, the script will also transfer the publication's PMID and PMCID (if defined).

-- NOTE: Before executing the app, make sure that your Papers and Bookends apps are running,
-- and that you've selected all publications in your Papers library that you'd like to export to
-- Bookends. Then run the script to start the export process.

-- NOTE: Upon completion, Bookends will display a modal dialog reporting how many publications
-- (and PDFs) were imported. If the reported number of imported publications is less than the
-- number of publications selected in your Papers library, you may want to open Console.app and
-- checkout your system's console log for any errors reported by the script.

-- NOTE: Due to a Papers scripting bug, the PDFs exported via this script won't include any
-- annotations that you've added in Papers. However, the below workaround allows you to also
-- include your annotations when exporting publications from your Papers library to Bookends:

-- To include annotations from your Papers library inside the exported PDFs, do this once (before
-- you run this script):
-- 1. Make sure that the default Bookends attachments folder exists: This is the "Attachments"
--     folder inside the "Bookends" folder within your "Documents" folder. Alternatively, you
--     can specify a different folder in the `attachmentsFolderPath` property (see below).
-- 2. Select all publications in your Papers library that you want to export, then choose
--     the "File > Export… > PDF Files and Media" menu command, and make sure that the
--     "Include annotations" checkbox is checked (in the save dialog, you may have to click
--     the "Options" button to see this option).
-- 3. In the save dialog, choose the attachments folder from step 1, and click the "Export"
--     button.
-- This will export all primary PDFs of all selected publications into your attachments folder.
-- When you then run this script, the PDFs in your attachments folder will be used for import
-- into Bookends.


-- ----------- you may edit the values of the properties below ------------------

-- Specifies whether the publication's flagged status shall be exported to Bookends (`true`)
-- or not (`false`). If `true`, and if the publication was flagged in your Papers library, this script
-- will add the string given in `flaggedKeyword` (see below) as a keyword to the newly created
-- Bookends publication.
property transferPapersFlags : true

-- The keyword to be added to the newly created Bookends publication if the publication was
-- flagged in your Papers library.
property flaggedKeyword : "Papers_flagged"

-- Specifies whether the publication's color label shall be exported to Bookends (`true`) or not
-- (`false`). If `true`, and if the publication was marked in your Papers library with a color label,
-- this script will add the color's name (prefixed with the string given in `papersLabelPrefix`, see
-- below) as a keyword to the newly created Bookends publication.
property transferPapersLabel : true

-- The string that will be prepended to a Papers color label name in order to form a special keyword
-- which will be added to a newly created Bookends publication if the publication was marked in your
-- Papers library with a color label. For example, using the default prefix string, a Papers entry marked
-- with a red color label would be tagged with "Papers_label_red" in Bookends.
property papersLabelPrefix : "Papers_label_"

-- Specifies whether the publication's "papers://…" link shall be exported to Bookends (`true`)
-- or not (`false`). If `true` the "papers://…" link will be appended to the Bookends "Notes" field.
property transferPapersLink : true

-- Specifies whether the publication's citekey shall be exported to Bookends (`true`)
-- or not (`false`). If `true` the Papers citekey will be written to the Bookends "Key" field.
property transferPapersCitekey : true

-- Specifies the path to the attachments folder. For each Papers publication that shall be exported,
-- this script will check this folder for a matching file attachment. And if this folder contains a file
-- which exactly matches the formatted name of the publication's primary PDF, this file will be used
-- for import into Bookends. Otherwise, a new file copy will be exported from your Papers library.
-- Note that the path must be given as a POSIX path, either absolute or relative to your home folder.
-- Use an empty string ("") to have the script ask for the attachment folder upon first run. The folder
-- path will be remembered until the script is recompiled.
property attachmentsFolderPath : "~/Documents/Bookends/Attachments"

-- ----------- usually, you don't need to edit anything below this line -----------

property attachmentsFolder : missing value
property tempFolder : missing value

use KeypointsLib : script "KeypointsScriptingLib"
use scripting additions


on run
	my setupAttachmentsFolder()
	my setupTempFolder()
	KeypointsLib's setupProgress("Importing selected Papers publications into Bookends library…")
	
	tell application id "com.mekentosj.papers3"
		set selectedPubs to selected publications of front library window
		if selectedPubs is not {} then
			set exportFilePath to (tempFolder as string) & "PapersToBookends.ris"
			my exportPublicationsAsRIS(selectedPubs, exportFilePath)
			delay 1
			set risRecords to my risRecordsFromFile(exportFilePath as alias)
			set {bookendsImportedIDs, bookendsImportedPDFs} to my exportToBookends(selectedPubs, risRecords)
			tell application "Bookends"
				activate
				display dialog "Imported publications: " & (count of bookendsImportedIDs) & linefeed & "Imported PDFs: " & (count of bookendsImportedPDFs) ¬
					with title "Finished Importing Publications" with icon note buttons {"OK"} default button "OK"
			end tell
		else
			KeypointsLib's displayError("Nothing selected!", "Please select some publications in your Papers library for export into Bookends.", 15, true)
		end if
	end tell
end run


-- Exports the given list of publication items from your Papers 3 library as RIS to the specified file path
on exportPublicationsAsRIS(pubList, exportFilePath)
	if pubList is {} then
		KeypointsLib's displayError("Couldn't export RIS file!", "No publications were given for export.", 15, true)
	else if exportFilePath is missing value or exportFilePath is "" then
		KeypointsLib's displayError("Couldn't export selected publications as RIS file!", "No export path provided.", 15, true)
	end if
	
	tell application id "com.mekentosj.papers3"
		export pubList as RIS to file exportFilePath
	end tell
end exportPublicationsAsRIS


-- Returns a list of RIS records from the given RIS file
on risRecordsFromFile(risFileAlias)
	set risFileContents to KeypointsLib's readFromFile(risFileAlias)
	if risFileContents does not contain "TY  - " then
		KeypointsLib's displayError("Couldn't read RIS file contents!", "The exported RIS file could not be read again.", 15, true)
	end if
	
	-- insert a unique delimiter between RIS records, and split on this delimiter
	set risFileContents to KeypointsLib's regexReplace(risFileContents, linefeed & "ER  - " & linefeed & "+TY  - ", linefeed & "ER  - " & linefeed & "$$##SPLIT_DELIM##$$" & linefeed & "TY  - ")
	set risFileRecords to KeypointsLib's splitText(risFileContents, "$$##SPLIT_DELIM##$$" & linefeed)
	
	return risFileRecords
end risRecordsFromFile


-- Takes a list of publication items from your Papers 3 library and a matching list of RIS records, and imports them into Bookends
on exportToBookends(pubList, risRecordList)
	local aRISRecord
	set bookendsImportedIDs to {}
	set bookendsImportedPDFs to {}
	set pubCount to count of pubList
	set risRecordCount to count of risRecordList
	if pubCount is not equal to risRecordCount then
		KeypointsLib's displayError("Publications don't match RIS file contents!", "The count of publications to be exported doesn't match the number of records in the RIS file.", 15, true)
	end if
	KeypointsLib's setTotalStepsForProgress(pubCount)
	
	repeat with i from 1 to pubCount
		tell application id "com.mekentosj.papers3"
			set aPub to item i of pubList
			set pubType to resource type of aPub
			set pubName to title of aPub
			KeypointsLib's updateProgress(i, "Importing publication " & i & " of " & pubCount & " (\"" & pubName & "\").")
			
			set aRISRecord to item i of risRecordList
			
			-- remove file spec from RIS record since we provide our own file to Bookends below
			set aRISRecord to KeypointsLib's regexReplace(aRISRecord, linefeed & "L1  - file://.+", "")
			
			-- for books, convert the BT tag in the RIS record to TI so that Bookends 12.8.3 and earlier correctly recognizes the book's title
			set risType to KeypointsLib's regexMatch(aRISRecord, "(?<=^TY  - ).+")
			if risType is "BOOK" then -- we check the type of the RIS record (instead of pubType) since this also catches eBooks etc
				set aRISRecord to KeypointsLib's regexReplace(aRISRecord, "(?<=" & linefeed & ")BT(?=  - )", "TI")
			end if
			
			-- remove any abbreviated journal name from RIS record since Bookends will autocomplete this using its Journal Glossary
			if pubType is "Journal Article" then
				set pubHasFullJournalName to (KeypointsLib's regexMatch(aRISRecord, linefeed & "T2  - .+") is not "")
				if pubHasFullJournalName then
					set aRISRecord to KeypointsLib's regexReplace(aRISRecord, linefeed & "J2  - .+", "")
				end if
			end if
			
			set bookendsImportInfo to ""
			
			set aFile to primary file item of aPub
			if aFile is not missing value then -- export file & metadata
				set fileName to formatted file name of aFile
				if fileName is missing value then
					KeypointsLib's displayError("Couldn't get file name!", "The file at \"" & filePath & "\" could not be found.", 15, true)
				end if
				
				-- check if the attachments folder already contains an existing file with a matching name (if so, use that, else export a new copy)
				set pdfExportFilePath to (attachmentsFolder as string) & fileName
				if KeypointsLib's fileExistsAtFilePath(POSIX path of pdfExportFilePath) then
					set pdfExportFile to pdfExportFilePath as alias
				else
					-- NOTE: due to a scripting bug in Papers, annotations are not included when exporting the file (even if Papers is setup to do so)
					export {aPub} as PDF Files to file (tempFolder as string)
					set pdfExportFile to ((tempFolder as string) & fileName) as alias
				end if
				
				tell application "Bookends" to set bookendsImportInfo to «event PPRSADDA» (POSIX path of pdfExportFile) given «class RIST»:aRISRecord
			else -- export just metadata
				tell application "Bookends" to set bookendsImportInfo to «event PPRSADDA» given «class RIST»:aRISRecord
			end if
			
			set bookendsImportID to ""
			set bookendsImportedPDF to ""
			if bookendsImportInfo is not "" then
				set bookendsImportID to KeypointsLib's regexMatch(bookendsImportInfo, "^\\d+(?=" & linefeed & ")")
				if bookendsImportID is not "" then
					copy bookendsImportID to end of bookendsImportedIDs
				else
					KeypointsLib's logToSystemConsole(name of me, "Couldn't properly import publication \"" & pubName & "\". Bookends info: " & bookendsImportInfo)
				end if
				
				set bookendsImportedPDF to KeypointsLib's regexMatch(bookendsImportInfo, "(?<=\\d" & linefeed & ").+\\.pdf(?=$|" & linefeed & ")")
				if bookendsImportedPDF is not "" then copy bookendsImportedPDF to end of bookendsImportedPDFs
			else
				KeypointsLib's logToSystemConsole(name of me, "Couldn't properly import publication \"" & pubName & "\".")
			end if
			
			if bookendsImportID is not "" then
				try -- getting the json string may cause a -10000 error
					set pubJSON to json string of aPub
				on error errorText number errorNumber
					if errorNumber is not -128 then
						set pubJSON to missing value
						KeypointsLib's logToSystemConsole(name of me, "Couldn't properly import color label, language and/or edition for publication \"" & pubName & "\"." & linefeed & "Error: " & errorText & " (" & errorNumber & ")")
					end if
				end try
				
				-- set rating
				set rating to my rating of aPub
				if rating > 0 then
					tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"rating", string:rating
				end if
				
				if transferPapersLabel and pubJSON is not missing value then -- set color label
					set papersLabel to KeypointsLib's regexMatch(pubJSON, "(?<=" & linefeed & "  \"label\": ).+(?=,)")
					if papersLabel > 0 then
						-- TODO: set the Bookends color label directly (as of Bookends 12.8.3, this isn't supported yet)
						--set bookendsLabel to my bookendsLabelForPapersLabel(papersLabel)
						--tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"colorlabel", string:bookendsLabel
						
						tell application "Bookends"
							set tags to «event PPRSRFLD» bookendsImportID given string:"keywords"
							if tags is not "" then set tags to tags & linefeed
							«event PPRSSFLD» bookendsImportID given «class FLDN»:"keywords", string:tags & papersLabelPrefix & my papersColorForPapersLabel(papersLabel)
						end tell
					end if
				end if
				
				if transferPapersFlags then -- set flagged
					set isFlagged to flagged of aPub
					if isFlagged then
						tell application "Bookends"
							set tags to «event PPRSRFLD» bookendsImportID given string:"keywords"
							if tags is not "" then set tags to tags & linefeed
							«event PPRSSFLD» bookendsImportID given «class FLDN»:"keywords", string:tags & flaggedKeyword
						end tell
					end if
				end if
				
				if pubJSON is not missing value then -- set language
					set language to KeypointsLib's regexMatch(pubJSON, "(?<=" & linefeed & "  \"language\": \").+(?=\")")
					if language is not missing value and language is not "" then
						tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"user7", string:language
					end if
				end if
				
				if pubJSON is not missing value then -- set edition
					set edition to KeypointsLib's regexMatch(pubJSON, "(?<=" & linefeed & "  \"version\": \").+(?=\")")
					if edition is not missing value and edition is not "" then
						tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"user2", string:edition
					end if
				end if
				
				if pubType is "Journal Article" then -- set PMID & PMCID
					set aPMID to pmid of aPub
					if aPMID is not missing value and aPMID is not "" then
						tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"user18", string:aPMID
					end if
					
					set aPMCID to pmcid of aPub
					if aPMCID is not missing value and aPMCID is not "" then
						tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"user16", string:aPMCID
					end if
				end if
				
				if transferPapersLink then -- append the "papers://…" link to the "notes" field
					set papersLink to item url of aPub
					if papersLink is not missing value and papersLink is not "" then
						tell application "Bookends"
							set notes to «event PPRSRFLD» bookendsImportID given string:"notes"
							if notes is not "" then set notes to notes & linefeed & linefeed
							«event PPRSSFLD» bookendsImportID given «class FLDN»:"notes", string:notes & papersLink
						end tell
					end if
				end if
				
				if transferPapersCitekey then -- set Papers citekey
					set papersCitekey to citekey of aPub
					if papersCitekey is not missing value and papersCitekey is not "" then
						tell application "Bookends" to «event PPRSSFLD» bookendsImportID given «class FLDN»:"user1", string:papersCitekey
					end if
				end if
			end if
		end tell
	end repeat
	
	KeypointsLib's updateProgress(pubCount, "Successfully imported " & (count of bookendsImportedIDs) & " publications with " & (count of bookendsImportedPDFs) & " PDFs.")
	
	return {bookendsImportedIDs, bookendsImportedPDFs}
end exportToBookends


-- Attempts to setup the attachments folder based on the POSIX path given in attachmentsFolderPath, or,
-- if that path doesn't exist, asks the user to specify an attachments folder. Note that the folder path will
-- be remembered until the script is recompiled.
on setupAttachmentsFolder()
	if attachmentsFolderPath starts with "~/" then
		set homeFolderPath to POSIX path of (path to home folder)
		set attachmentsFolderPath to KeypointsLib's regexReplace(attachmentsFolderPath, "^~/", homeFolderPath)
	end if
	if KeypointsLib's fileExistsAtFilePath(attachmentsFolderPath) then
		set attachmentsFolder to POSIX file attachmentsFolderPath as alias
	else
		set attachmentsFolder to choose folder with prompt "Select the attachments folder containing any file attachments"
	end if
end setupAttachmentsFolder


-- Sets up the temporary folder. If the temp folder already exists, this will also remove any contained files.
on setupTempFolder()
	set tempFolderContainer to path to temporary items
	set tempFolderPath to KeypointsLib's createNewFolder(POSIX path of tempFolderContainer, name of me)
	set tempFolder to POSIX file tempFolderPath as alias
	KeypointsLib's deleteFolderContents(tempFolder) -- deletes any existing items from the temp folder
end setupTempFolder


-- Returns the index of the Bookends color label corresponding to the given Papers label index.
on bookendsLabelForPapersLabel(papersLabel)
	-- Papers label -> Bookends label (color name)
	-- 0 -> 0 (none)
	-- 1 -> 1 (red)
	-- 2 -> 2 (orange)
	-- 3 -> 7 (yellow)
	-- 4 -> 3 (green)
	-- 5 -> 4 (blue)
	-- 6 -> 5 (purple)
	-- 7 -> 6 (Papers: grey / Bookends: brown)
	set bookendsLabels to {1, 2, 7, 3, 4, 5, 6}
	
	if papersLabel ≥ 1 and papersLabel ≤ 7 then
		return item papersLabel of bookendsLabels
	else
		return 0
	end if
end bookendsLabelForPapersLabel


-- Returns the color name for the given Papers label index.
on papersColorForPapersLabel(papersLabel)
	set papersColors to {"red", "orange", "yellow", "green", "blue", "purple", "grey"}
	
	if papersLabel ≥ 1 and papersLabel ≤ 7 then
		return item papersLabel of papersColors
	else
		return "none"
	end if
end papersColorForPapersLabel
