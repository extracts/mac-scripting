-- DEVONthink Notes from PDF Annotations
-- version 1.2, licensed under the MIT license

-- by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

-- For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations
-- and create or update a Markdown record for each markup or text annotation.

-- This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.4 or greater,
-- and DEVONthink Pro v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep
-- links to PDF annotations work correctly).


-- Setup:

-- -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the properties
--     `label1` ... `label7` below and save this script again. If saving generates an error, please try again with
--     Script Debugger (which has a free "lite" mode): https://latenightsw.com/sd8/download/

-- -- You may also want to check the other properties below. These allow to customize the script, e.g. to enable
--     updating of existing notes, or automatic fetching of BibTeX data.

-- -- Copy the script to a suitable place, like the DEVONthink script folder, or the system's script menu folder.
--     For a guide on how to enable and use the system's script menu, see:
--     https://iworkautomation.com/numbers/script-menu.html

-- -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut
--     description (like `___Command-Shift-Alt-A`) to the script's name. After restarting DEVONthink, you should
--     be able to run your script via the specified keyboard shortcut.


-- Usage:

-- -- Before running the script, please select one or more PDF records with PDF annotations in DEVONthink.

-- -- To run the script, select its menu entry from the (DEVONthink or system's) script menu, or press your
--     specified keyboard shortcut.

-- -- After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed
--     and how many note records have been created/updated. For each PDF, its annotation notes are stored
--     within a DEVONthink group next to the PDF. By default, the group is named identical to the PDF but
--     contains an " – Annotations" suffix.

-- -- Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink.
--     On a subsequent run of the script, all notes that were newly created (or updated) will be selected.


-- Discussion & Help:

-- -- https://discourse.devontechnologies.com/t/script-to-create-individual-markdown-notes-from-pdf-annotations/80987
--     https://github.com/extracts/mac-scripting/discussions


-- Notes:

-- -- The script will only recognize these annotation types: "Highlight", "StrikeOut", "Underline", "Squiggly", "Text"
--     and "FreeText".

-- -- For each selected PDF with PDF annotations, the script will create a DEVONthink group next to it containing
--     Markdown record(s) for all recognized PDF annotation(s). The group's name can be controlled via the properties
--     `noteFolderNamePrefix` & `noteFolderNameSuffix` below.

-- -- You can run the script multiple times with the same PDF record(s) selected in DEVONthink. If PDF annotations
--     have been added to the PDF file after the last script run, the next script run will add Markdown records for the
--     newly created PDF annotations. Note that deletions will not get synced across. If existing PDF annotations have
--     been updated the script can update the corresponding Markdown records. While this is off by default, it can be
--     enabled by setting below property `updateExistingNotes` to `true`. In that case, these properties can be updated
--     (if enabled below): name, note text, modification date, flagged status, rating, label, tags, custom metadata.
--     Note that if you change a PDF annotation's annotation type (say, from "Highlight" to "Underline"), this will always
--     create a new Markdown note.

-- -- If possible, the PDF annotation's source text will get added to the body text of the Markdown record. However
--     note that, depending on the tool used for PDF annotation, this may fail or be inaccurate. In that case, you may
--     improve text extraction success by tweaking the properties `lineWidthEnlargement` & `lineHeightEnlargement`
--     below.

-- -- Notes that have been added to a PDF annotation will also get added to the Markdown record's body text. Within
--     a PDF annotation note, you can use following (Keypoints-style) syntax to explicitly set the name of the Markdown
--     record and/or its properties:
--     - A line prefixed with `# ` (like a Markdown first-level heading) will be used as the Markdown record's name.
--     - One or more line(s) prefixed with `< ` indicate a metadata line which will get stripped from the record's
--        body text but which will set record properties instead:
--        - In a metadata line, include 1 to 5 asterisks or `★` characters to set the record's star-rating, for example
--          `< ****` would set a 4-star rating for the Markdown record.
--        - In a metadata line, add the special tag `@:flagged` to set the Markdown record's flagged status to true.
--        - In a metadata line, add any tags like `@tag` or `@another tag` to set these as the tags of the Markdown
--          record.
--        - In a metadata line, add any custom key:value attributes like `@:key:Some value` to set these as custom
--          metadata of the Markdown record. A custom attribute w/o a value (like `@:key`) will get a default value
--          of `true`.
--        Note that you can also include any/all of these properties on a single metadata line, for example:
--        `< **** @:flagged @tag @another tag @:key:Some value`

-- -- If your PDF annotation notes contain custom markup syntax, you can use the `preprocessAnnotationComment()`
--     method to preprocess & transform this syntax to the (Keypoints-style) format described above.

-- -- For your PDF record, as well as for each of the created Markdown records, a link to the "... – Annotations" group
--     folder will be copied to a custom metadata field (named `pdfannotations`). This allows you to easily get back to
--     the PDF's group of annotation notes.

-- -- The URL field of each Markdown record will be set to a deep link that directly points to the corresponding PDF
--     annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation
--     into view. Note that this requires DEVONthink 3.9 or greater.

-- -- For each Markdown record, the script will try to assign a color label that matches your annotation's highlight color.
--     Note that, to suit your personal DEVONthink label setup, you'll need to adjust the mapping via the properties
--     `label1` ... `label7` below.

-- -- For each Markdown record, the script will also add an ID-like alias (like "039H-8GAB-1GPA") that's unique and
--     which optionally can be used to create a stable Wiki-link (like "[[039H-8GAB-1GPA]]") to this Markdown record.

-- -- For each Markdown record, the script will also add a sort identifier string (like "2-1-125" which codifies with integers
--     the annotation's page, column & position from top) to the `annotationorder` custom metadata field. This metadata
--     field can be used in DEVONthink to sort annotations in the order they appear in the text of a page. By default,
--     sort identifiers will be generated so that they try to respect a typical 2-column text layout. Note that this may not
--     always be perfect. To further control sort identifier generation, see the properties `respectMultiColumnPDFLayouts`
--     and `maxTextColumns` below.

-- -- If the PDF metadata contain a DOI, this DOI will get written to the `doi` custom metadata field for your PDF
--     record, the "... – Annotations" group, and for each of the created Markdown records.

-- -- Similarly, if the PDF record's custom metadata contain a citekey, this citekey will also get written to the `citekey`
--     custom metadata field for the "... – Annotations" group, and for each of the created Markdown records.

-- -- If a DOI was found for the PDF, the script will also attempt to fetch its bibliographic metadata and set the custom
--     metadata and/or the Finder comment of the "... – Annotations" group & its Markdown records accordingly. Please
--     see the properties below for options to disable or fine-tune this behaviour.


-- Ideas for Improvement:

-- allow name & content of created Markdown records to be generated via a template (e.g., to allow for custom YAML headers)
-- allow the script to be called by a smart rule (displaying feedback on completion in a notification and w/o selecting any updated records)
-- offer a configuration option to specify which metadata shall get exported into which custom metadata field
-- if just some DEVONthink groups were selected, allow to get all contained PDFs and process these
-- allow to optionally look-up the PDF file in a reference manager like Bookends and auto-fetch citekey & citation info from there
-- allow to (optionally) remove tags from Markdown records for PDF annotations whose corresponding tags were removed
-- allow to (optionally) remove Markdown records from DEVONthink for PDF annotations that were deleted from the PDF
-- support any annotation types other than "Highlight", "StrikeOut", "Underline", "Squiggly", "Text" & "FreeText"
-- (see also inline TODOs in the code below)


-- ------------- optionally adopt the property values below this line -------------


-- Prefix prepended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.
property noteFolderNamePrefix : ""

-- Suffix appended to the name of the DEVONthink group that hosts a PDF file's Markdown notes.
property noteFolderNameSuffix : " – Annotations"

-- Maps DEVONthink label indexes to color names. Please set the `colorName` values according
--  to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".
-- E.g., if your "Color" settings specify a yellowish color for the first label, then use
-- `{labelIndex:1, colorName:"yellow"}`. Note that each label must have a unique color name.
-- Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink
property label1 : {labelIndex:1, colorName:"red"}
property label2 : {labelIndex:2, colorName:"green"}
property label3 : {labelIndex:3, colorName:"light blue"}
property label4 : {labelIndex:4, colorName:"yellow"}
property label5 : {labelIndex:5, colorName:"orange"}
property label6 : {labelIndex:6, colorName:"dark blue"}
property label7 : {labelIndex:7, colorName:"purple"}

-- Set to `true` if you want this script to update Markdown records that already exist in DEVONthink
-- for PDF annotations from your PDF file(s) and which were created on previous script runs. This will
-- be only necessary if you've made changes to the PDF annotations (or their associated notes) within
-- the PDF file after importing them into DEVONthink.
-- Notes:
-- - @warning Note that updating of existing notes may override any additions/changes that you've
--    made to these Markdown records in DEVONthink.
-- - See below properties to specify which attributes shall get updated and which shall be left alone.
property updateExistingNotes : false

-- When updating existing Markdown records, specify which attributes shall get updated (`true`)
-- and which shall be left alone (`false`).
-- Notes:
-- - Tags will only be added to any existing list of record tags, so these won't get replaced as a whole.
--    Also, tags won't get removed from the existing list of record tags.
-- - Custom metadata fields will also get added to any existing record metadata, and only fields
--    of the same name may get replaced.
property updateNameForExistingNotes : false
property updateTextContentForExistingNotes : true
property updateModificationDateForExistingNotes : true
property updateFlaggedStatusForExistingNotes : true
property updateRatingForExistingNotes : true
property updateLabelForExistingNotes : true
property updateTagsForExistingNotes : true
property updateCustomMetadataForExistingNotes : true

-- Specify if custom metadata of the DEVONthink groups that host a PDF file's Markdown notes shall
-- get updated (`true`) or not (`false`). If set to `true`, this script may populate the custom metadata
-- properties `sourcefile`, `citekey` & `doi`, as well as any bibliographic metadata that were fetched
-- for a DOI (see below).
property updateCustomMetadataForExistingFolders : true

-- Set to `true` if you want this script to select all records that were actually created or updated.
property selectUpdatedRecords : true

-- Set to `true` if you want this script to fetch bibliographic metadata for a PDF's DOI via an online
-- request to OpenAlex.org (and possibly further requests to CrossRef, see below).
-- Note that setting this to `false` will disable all online requests, i.e. this will also prevent fetching
-- of BibTeX data & formatted citations even if the respective properties have been set to `true` below.
property fetchDOIMetadata : true

-- Set to `true` if you want this script to _always_ fetch bibliographic metadata for a PDF's DOI, and
-- not only once for each PDF (when creating the DEVONthink group that hosts the PDF file's Markdown
-- notes). Usually, you'd want the latter (i.e. `false`). But setting this property (temporarily) to `true`
-- can be useful to add or update bibliographic metadata for existing notes folders & Markdown notes.
property alwaysFetchDOIMetadata : false

-- When fetching bibliographic metadata for a PDF's DOI, this script can also fetch corresponding
-- BibTeX data (which will be copied to a custom ("bibtex") metadata field, and which can be
-- appended to the Finder comment of a created Markdown record as well (see below)).
-- Set to `true` if you also want to fetch BibTeX data for the given DOI from CrossRef.org, else set
-- to `false`. Note that this will cause an extra online request which may take a second or so.
property fetchBibTeX : false

-- Set to `true` if you want this script to append the BibTeX data (that was fetched for a PDF's DOI)
-- to the Finder comment of the created Markdown record.
property appendBibTeXToFinderComment : false

-- When fetching bibliographic metadata for a PDF's DOI, this script can also fetch a corresponding
-- formatted citation (which will be copied to a custom ("reference") metadata field, and which can
-- be appended to the Finder comment of a created Markdown record as well (see below)).
-- Set to `true` if you also want to fetch a formatted citation for the given DOI from CrossRef.org,
-- else set to `false`. Note that this will cause an extra online request which may take a few seconds.
property fetchFormattedCitation : true

-- Set to `true` if you want this script to append the formatted citation (that was fetched for a PDF's
-- DOI) to the Finder comment of the created Markdown record.
property appendFormattedCitationToFinderComment : true

-- The name of the citation style file (as obtained from https://www.zotero.org/styles) to be used
-- when generating a formatted citation, e.g.:
-- apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,
-- modern-language-association, vancouver-author-date
property citationStyleName : "apa"

-- The locale code that specifies which localization data (term translations, localized date formats,
-- and grammar options) shall be used when generating a formatted citation, e.g.:
-- en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN
property citationLocale : "en-US"


-- ----------- usually, you don't need to edit anything below this line -----------


-- Decimal numbers that specify how much the bounding box encompassing an annotation's
-- individual line shall be enlarged vertically & horizontally so that it fully covers all text
-- highlighted on that line.
-- If you find that this script somehow fails to fully extract all of an annotation's text (or if
-- it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1
-- increments).
-- However, note that larger values will increase the likeliness that adjacent characters not
-- belonging to the annotation will get included as well.
property lineWidthEnlargement : 0.7
property lineHeightEnlargement : 1.7

-- Defines lower and upper hue limits for common colors. Limit values are inclusive and must be
-- given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.
property redColorMapping : {colorName:"red", lowerHueLimit:350, upperHueLimit:19}
property orangeColorMapping : {colorName:"orange", lowerHueLimit:20, upperHueLimit:44}
property yellowColorMapping : {colorName:"yellow", lowerHueLimit:45, upperHueLimit:65}
property greenColorMapping : {colorName:"green", lowerHueLimit:66, upperHueLimit:164}
property cyanColorMapping : {colorName:"cyan", lowerHueLimit:165, upperHueLimit:184}
property lightBlueColorMapping : {colorName:"light blue", lowerHueLimit:185, upperHueLimit:209}
property darkBlueColorMapping : {colorName:"dark blue", lowerHueLimit:210, upperHueLimit:254}
property purpleColorMapping : {colorName:"purple", lowerHueLimit:255, upperHueLimit:324}
property pinkColorMapping : {colorName:"pink", lowerHueLimit:325, upperHueLimit:349}

property colorMappings : {redColorMapping, orangeColorMapping, yellowColorMapping, greenColorMapping, cyanColorMapping, lightBlueColorMapping, darkBlueColorMapping, purpleColorMapping, pinkColorMapping}

property labelMappings : {label1, label2, label3, label4, label5, label6, label7}

-- Set to `true` if you want this script to associate annotations to text columns in multi-column
-- PDF layouts when generating sort identifiers.
-- Sort identifiers will be placed in an `annotationorder` metadata field which can be used in
-- DEVONthink for sorting so that annotations can be listed in the order they appear in the text
-- of a page (optionally respecting a multi-column layout).
-- Sort identifier format: `<PAGE>-<COLUMN>-<POSITION_FROM_TOP>` (e.g. "2-1-207").
-- If this property is set to `false`, `<COLUMN>` will be always "1".
-- Note that, depending on the layout of the PDF page and the specific annotation's width,
-- correctly guessing the annotation's text column may still fail.
property respectMultiColumnPDFLayouts : true

-- The number of text columns supported by this script when generating sort identifiers.
-- If you're often dealing with PDF text layouts that have more than the specified number of text
-- columns then you may want to adjust this integer number. However, note that larger values
-- will increase the likeliness that short annotations or annotations from document parts
-- spanning multiple columns (like the abstract) won't sort correctly.
property maxTextColumns : 2

-- Approximate average width of the (left or right) white space between text & page origin/end.
-- Note that this is just a wild guess for the average margin of a PDF page as properly calculating
-- margins isn't straightforward. However, specifying some value for an average margin usually
-- helps when trying to associate annotations to text columns in multi-column PDF layouts.
property pageMargin : 20

property createdNotesCount : 0
property updatedNotesCount : 0

-- The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.
-- It can be made available to this script by copying it into a "Script Libraries" folder inside
-- the "Library" folder that's within your Home folder.
-- see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib
use KeypointsLib : script "KeypointsScriptingLib" -- v1.4 or greater required

use framework "/System/Library/Frameworks/AppKit.framework"
use framework "/System/Library/Frameworks/Quartz.framework"
use scripting additions


-- Main handler.
on run
	-- DEVONthink must be running for this script to work
	if not my checkAppsRunning() then return
	
	KeypointsLib's setupProgress("Creating Markdown notes for annotations in selected PDFs")
	
	-- only deal with currently selected PDFs that contain PDF annotations
	set pdfRecords to my selectedDEVONthinkPDFsWithPDFAnnotations()
	
	-- initialize progress reporting
	set createdNotesCount to 0
	set updatedNotesCount to 0
	set pdfCount to count of pdfRecords
	KeypointsLib's setTotalStepsForProgress(pdfCount)
	
	-- process PDF annotations for each PDF
	repeat with i from 1 to pdfCount
		set pdfRecord to item i of pdfRecords
		tell application id "DNtp" to set pdfFilename to filename of pdfRecord
		KeypointsLib's updateProgress(i, "Processing PDF " & i & " of " & pdfCount & " (\"" & pdfFilename & "\").")
		set updatedRecords to my createDEVONthinkNotesForPDF(pdfRecord)
	end repeat
	
	-- select records that were created or updated
	if selectUpdatedRecords is true and updatedRecords is not {} then
		tell application id "DNtp"
			set frontWindow to viewer window 1
			set selection of frontWindow to updatedRecords
		end tell
	end if
	
	-- display a dialog with feedback (number of PDFs processed and notes created/updated)
	tell application id "DNtp"
		activate
		display dialog "Processed PDFs: " & pdfCount & linefeed & "Created notes: " & createdNotesCount & linefeed & "Updated notes: " & updatedNotesCount ¬
			with title "Finished Import of PDF Annotations" with icon 2 buttons {"OK"} default button "OK"
	end tell
end run


-- Checks if DEVONthink Pro is running.
-- Credits: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on checkAppsRunning()
	tell application id "sevs" -- application "System Events"
		if (count of (processes where creator type = "DNtp")) < 1 then
			KeypointsLib's displayError("DEVONthink Pro not running!", "Please open DEVONthink Pro and select some PDF(s), then run this script again.", 15, true)
			return false
		end if
	end tell
	return true
end checkAppsRunning


-- Returns all PDF records from the records selected in DEVONthink that contain some
-- PDF annotations. If there's currently no selection in DEVONthink (or if the selection
-- contains no PDFs with PDF annotations) presents an error alert and aborts the script.
on selectedDEVONthinkPDFsWithPDFAnnotations()
	set annotatedPDFs to {}
	
	tell application id "DNtp"
		set theRecords to (selection as list)
		repeat with theRecord in theRecords
			if (type of theRecord is PDF document) and (annotation count of theRecord > 0) then
				copy theRecord to end of annotatedPDFs
			end if
		end repeat
		
		if annotatedPDFs is {} then KeypointsLib's displayError("No PDF(s) with PDF annotations selected!", "Please open DEVONthink and select some PDF(s) with PDF annotations.", 15, true)
	end tell
	
	return annotatedPDFs
end selectedDEVONthinkPDFsWithPDFAnnotations


-- Iterates over the given PDF's contained PDF annotations and creates a DEVONthink
-- record for each markup or text annotation (if it doesn't exist yet).
-- Returns a list with all records that were actually updated. I.e., if a PDF annotation did
-- already have a corresponding Markdown record in DEVONthink which wasn't updated
-- (since its text content & properties were already up-to-date), it won't get included in
-- the returned list.
-- @param pdfRecord The DEVONthink record representing the PDF whose annotations
-- shall be extracted.
on createDEVONthinkNotesForPDF(pdfRecord)
	-- assemble info for the PDF record and its (possibly to be created) notes folder
	tell application id "DNtp"
		set pdfPath to path of pdfRecord
		set pdfurl to reference URL of pdfRecord
		set pdfLocationPath to location of pdfRecord
		
		set pdfMetadata to custom meta data of pdfRecord
		try
			-- pdfMetadata may be undefined in which case this triggers the error case
			if pdfMetadata is missing value then set pdfMetadata to {}
		on error
			set pdfMetadata to {}
		end try
		
		-- if necessary, create the notes folder, i.e. the DEVONthink group that hosts the PDF file's Markdown notes
		set noteFolderName to noteFolderNamePrefix & name of pdfRecord & noteFolderNameSuffix
		set folderLocationPath to (pdfLocationPath & noteFolderName & "/")
		set folderDidExist to exists record at folderLocationPath
		set folderLocation to create location folderLocationPath
		set folderURL to reference URL of folderLocation
		set URL of folderLocation to pdfurl & "?page=0"
		
		set folderMetadata to custom meta data of folderLocation
		try
			-- folderMetadata may be undefined in which case this triggers the error case
			if folderMetadata is missing value then set folderMetadata to {}
		on error
			set folderMetadata to {}
		end try
	end tell
	
	-- extract any DOI & citekey for the PDF from its custom metadata
	set sourceDOI to ""
	set sourceCitekey to ""
	if pdfMetadata is not {} then
		set metadataDOI to (KeypointsLib's valueForKey:"mddoi" inRecord:pdfMetadata)
		if metadataDOI is not missing value and metadataDOI is not "" then
			set sourceDOI to KeypointsLib's matchDOI(metadataDOI)
		end if
		set metadataCitekey to (KeypointsLib's valueForKey:"mdcitekey" inRecord:pdfMetadata)
		if metadataCitekey is not missing value and metadataCitekey is not "" then
			set sourceCitekey to metadataCitekey
		end if
	end if
	
	-- assemble info for all PDF annotations as a list of property records
	set {pdfAnnotationsList, sourceDOI} to my pdfAnnotationInfo(pdfPath, pdfurl, sourceDOI, sourceCitekey)
	
	-- sort all PDF annotations so that they are listed in the order they appear in the document & on the page
	-- NOTE: by default, PDF annotations seem to be ordered by page & creation date (?)
	--set pdfAnnotationsList to KeypointsLib's sortList:pdfAnnotationsList byKey:"sortString" inAscendingOrder:true usingSelector:"localizedStandardCompare:"
	
	-- set custom metadata fields for the PDF record: DOI & DT link back to the notes folder
	set pdfMetadata to pdfMetadata & {doi:sourceDOI, pdfannotations:folderURL}
	my setMetadataForDTRecord(pdfRecord, pdfMetadata)
	
	-- if the notes folder just got created, set its metadata
	set bibMetadata to {}
	set formattedCitation to ""
	set bibTeXData to ""
	if folderDidExist is false or alwaysFetchDOIMetadata is true then
		-- fetch bibliographic metadata for the PDF's DOI
		if fetchDOIMetadata is true and sourceDOI is not missing value and sourceDOI is not "" then
			set bibMetadata to my bibMetadataForDOI(sourceDOI, sourceCitekey)
			if bibMetadata is not {} then
				set formattedCitation to (KeypointsLib's valueForKey:"reference" inRecord:bibMetadata)
				set bibTeXData to (KeypointsLib's valueForKey:"bibtex" inRecord:bibMetadata)
			end if
		end if
		
		set folderMetadata to folderMetadata & {sourceFile:pdfPath, citekey:sourceCitekey, doi:sourceDOI}
		set folderMetadata to folderMetadata & bibMetadata
		
		my setMetadataForDTFolder(folderLocation, folderMetadata)
	end if
	
	-- if the notes folder just got created, append BibTeX data and/or the formatted citation to its Finder comment
	if folderDidExist is false then
		if appendFormattedCitationToFinderComment is true and formattedCitation is not missing value and formattedCitation is not "" then
			my appendToCommentOfDTFolder(folderLocation, formattedCitation)
		end if
		if appendBibTeXToFinderComment is true and bibTeXData is not missing value and bibTeXData is not "" then
			my appendToCommentOfDTFolder(folderLocation, bibTeXData)
		end if
	end if
	
	set updatedRecords to {}
	
	-- loop over each markup or text annotation in the PDF and create/update its corresponding Markdown record
	repeat with pdfAnnotation in pdfAnnotationsList
		set aComment to (pdfAnnotation's comment)
		if aComment is (current application's NSNull's |null|) then set aComment to missing value
		if aComment is not missing value then
			set aComment to my preprocessAnnotationComment(aComment as string)
		end if
		
		set annotText to (pdfAnnotation's annotText)
		if annotText is (current application's NSNull's |null|) then set annotText to missing value
		if annotText is not missing value then set annotText to annotText as string
		
		set aPageLabel to (pdfAnnotation's pageLabel)
		
		-- assemble record content from annotation text & comment
		set recordContents to my recordContentFromPDFAnnotationData(annotText, aComment)
		
		-- assemble record name from annotation text, comment & page label
		set recordName to my recordNameFromPDFAnnotationData(annotText, aComment, aPageLabel)
		
		-- record modification & creation date
		set recordModificationDate to (pdfAnnotation's modifiedDate) as date
		if recordModificationDate is not missing value then
			set recordCreationDate to recordModificationDate
			set recordAliases to KeypointsLib's keypointsIDForDate(recordCreationDate)
		end if
		
		set recordURL to (pdfAnnotation's deepLink) as string
		
		-- record metadata
		set annotType to (pdfAnnotation's annotType) as string
		set annotSortString to (pdfAnnotation's sortString) as string
		set recordMetadata to bibMetadata & {pdfannotations:folderURL, annotationType:annotType, annotationOrder:annotSortString}
		
		set aUserName to (pdfAnnotation's userName)
		if aUserName is not missing value and aUserName is not "" then set recordMetadata to recordMetadata & {createdBy:(aUserName as string)}
		
		if aPageLabel is not missing value and aPageLabel is not "" then set recordMetadata to recordMetadata & {sourcePage:(aPageLabel as string)}
		
		if pdfPath is not missing value then set recordMetadata to recordMetadata & {sourceFile:pdfPath}
		
		-- TODO: allow to extract (& prioritize) the citekey from the annotation comment (e.g. `< #Miller+Johns2024` or `< [#Miller+Johns2024]`)
		set citekey to (pdfAnnotation's citekey)
		if citekey is not missing value and citekey is not "" then set recordMetadata to recordMetadata & {citekey:citekey}
		
		if sourceDOI is not missing value and sourceDOI is not "" then set recordMetadata to recordMetadata & {doi:sourceDOI}
		
		-- extract tags (like `< @tag @another tag` or `< [@tag] [@another tag]`) as well as custom attributes
		-- (i.e., special tags like `< @:key:value @:key` or `< [@:key:value] [@:key]`) within the annotation comment
		set {customAttributes, recordTags} to KeypointsLib's customAttributesAndTagsFromKeypointsNote(aComment, {"flagged"})
		
		-- set the extracted custom attributes as dedicated record metadata
		repeat with customAttribute in customAttributes
			set aKey to customAttribute's attribKey
			set aValue to customAttribute's attribValue
			
			-- allow multiple occurrences of the same custom key with different values (e.g. `@:key:Some value @:key:Other value`)
			set existingValue to (KeypointsLib's valueForKey:aKey inRecord:recordMetadata)
			if existingValue is not missing value then
				set recordMetadata to (KeypointsLib's setValue:(existingValue & ";" & aValue) forKey:aKey inRecord:recordMetadata)
			else
				set recordMetadata to recordMetadata & (KeypointsLib's recordFromLabels:{aKey} andValues:{aValue})
			end if
		end repeat
		
		-- honor a flagged status (like `< @:flagged`) within the annotation comment
		set isFlagged to KeypointsLib's keypointsNoteIsMarkedAsFlagged(aComment)
		
		-- honor a rating (like `< ***`) within the annotation comment
		set recordRating to KeypointsLib's keypointsNoteRatingNumber(aComment)
		
		-- attempt to map the annotation's color to a DEVONthink label index
		-- TODO: allow to extract (& prioritize) the DEVONthink label from the annotation comment (e.g. `< (@Important)` or `< @1`)
		set recordLabelIndex to my labelIndexForColorName(pdfAnnotation's annotColorName)
		
		-- create a Markdown record for this annotation in DEVONthink
		set {dtRecord, recordWasUpdated} to my createDTRecord(folderLocation, folderMetadata, recordName, recordAliases, recordURL, recordTags, isFlagged, recordContents, recordCreationDate, recordModificationDate, recordMetadata, recordRating, recordLabelIndex)
		
		if recordWasUpdated is true then
			copy dtRecord to end of updatedRecords
		end if
	end repeat
	
	return updatedRecords
end createDEVONthinkNotesForPDF


-- For the given PDF, returns a list of records (where each record contains info about
-- one of its PDF annotations) as well as any DOI extracted from the PDF metadata.
-- @param pdfPath The POSIX path to the PDF file on disk.
-- @param pdfurl The `x-devonthink-item://...` URL of the corresponding PDF record
-- in DEVONthink.
-- @param sourceDOI The DOI of the publication represented by the PDF (may be
-- empty).
-- @param sourceCitekey The citekey of the publication represented by the PDF (may
-- be empty).
-- Credits: this method was inspired by a script by mdbraber
-- See https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30
on pdfAnnotationInfo(pdfPath, pdfurl, sourceDOI, sourceCitekey)
	set pdfDoc to current application's PDFDocument's alloc()'s initWithURL:(current application's |NSURL|'s fileURLWithPath:pdfPath)
	
	-- if there's no given DOI yet, try to get any DOI from PDF metadata or first PDF page
	if sourceDOI is "" then
		set pdfDOI to KeypointsLib's doiFromPDF(pdfPath, pdfDoc, true)
		if pdfDOI is not "" then
			set sourceDOI to pdfDOI
		end if
	end if
	
	-- iterate over each PDF page and process its annotations
	set pdfAnnotationsArray to current application's NSMutableArray's new()
	set columnID to 1
	repeat with i from 0 to ((pdfDoc's |pageCount|()) - 1) -- PDF pages are 0-based in PDFKit
		set pdfPage to (pdfDoc's pageAtIndex:i)
		set {pageWidth, pageHeight} to item 2 of (pdfPage's boundsForBox:(current application's kPDFDisplayBoxMediaBox))
		set columnWidth to (pageWidth - (2 * pageMargin)) / maxTextColumns
		set pageLabel to pdfPage's label()
		set pdfannotations to pdfPage's annotations()
		
		repeat with pdfAnnotation in pdfannotations
			set annotType to pdfAnnotation's |type|()
			
			if annotType is in {"Highlight", "StrikeOut", "Underline", "Squiggly", "Text", "FreeText"} then
				if annotType is in {"Highlight", "StrikeOut", "Underline"} then
					set markupType to pdfAnnotation's markupType()
				else
					set markupType to missing value
				end if
				
				-- TODO: parse & set key/value pairs from dictionary returned by `annotationKeyValues`?
				--            - `/CreationDate` (example: `/CreationDate:"D:20240810112845Z"`), set by DTTG but not DT/PDFKit on Mac?
				--            - `/Name` if it contains something more concrete than just "/Note" (example: `/Name:"/Note"`)
				--set annotKeyDict to pdfAnnotation's annotationKeyValues()
				
				-- get the annotation's color
				set {annotColor, annotColorName} to colorForAnnotation(pdfAnnotation)
				
				set annotUserName to pdfAnnotation's userName()
				set annotModDate to pdfAnnotation's modificationDate()
				
				set annotBounds to pdfAnnotation's |bounds|()
				set {annotOriginX, annotOriginY} to first item of annotBounds -- origin
				set {annotWidth, annotHeight} to second item of annotBounds -- size
				
				-- calculate a string identifier that can be used for sorting (so that annotations can be listed in the order they appear in the text of a page)
				-- NOTE: including a `columnID` allows to better sort annotations in multi-column PDF articles
				set annotTopMarginFromTop to pageHeight - (annotOriginY + annotHeight) -- in page space, the origin lies at the lower-left corner of the PDF page
				if respectMultiColumnPDFLayouts is true then set columnID to 1 + (round (annotOriginX / columnWidth) rounding down) -- the identifier of the column containing this annotation's origin
				set sortString to "" & i + 1 & "-" & columnID & "-" & ¬
					(round annotTopMarginFromTop rounding as taught in school)
				
				-- get the annotation's highlighted text
				if annotType is in {"Highlight", "StrikeOut", "Underline", "Squiggly"} then
					set quadPoints to pdfAnnotation's quadrilateralPoints()
					set boundsByLine to my annotationBoundsByLine(quadPoints, annotBounds)
					set annotText to my annotationText(pdfPage, boundsByLine)
				else
					set annotText to ""
				end if
				
				set annotComment to pdfAnnotation's |contents|()
				
				-- create a deep link for this annotation
				set annotURL to pdfurl & ¬
					"?page=" & i & ¬
					"&annotation=" & annotType & ¬
					"&x=" & (annotOriginX as integer) & ¬
					"&y=" & (annotOriginY as integer)
				
				(pdfAnnotationsArray's addObject:{citekey:sourceCitekey, page:i, pageLabel:pageLabel, annotType:annotType, markupType:markupType, annotColor:annotColor, annotColorName:annotColorName, userName:annotUserName, modifiedDate:annotModDate, annotText:annotText, comment:annotComment, deepLink:annotURL, sortString:sortString})
			end if
		end repeat
	end repeat
	
	return {pdfAnnotationsArray as list, sourceDOI}
end pdfAnnotationInfo


-- Assembles the content of a Markdown record from the given PDF annotation text
-- and comment.
on recordContentFromPDFAnnotationData(annotText, annotComment)
	set recordContentParts to {}
	if annotText is not missing value and annotText is not "" then
		copy "> " & (annotText as string) to end of recordContentParts
	end if
	
	if annotComment is not missing value and annotComment is not "" then
		set processedComment to annotComment
		
		-- ensure that a first-level heading at the top of the annotation comment stays there
		-- (even when annotation text gets inserted as a quotation)
		set firstLevelHeadingRegex to "^(?:\\s*[\\r\\n])*(#[ \\t]+.+)"
		set firstLevelHeading to KeypointsLib's regexMatch(annotComment, firstLevelHeadingRegex)
		if firstLevelHeading is not "" then
			set firstLevelHeading to KeypointsLib's regexReplace(firstLevelHeading, firstLevelHeadingRegex, "$1")
			copy firstLevelHeading to beginning of recordContentParts
			
			set processedComment to KeypointsLib's regexReplace(processedComment, firstLevelHeadingRegex & "[\\r\\n]?(\\s*[\\r\\n])*", "")
		end if
		
		-- for the record content, add the remaining annotation comment w/o any metadata lines (which start with "< ")
		set processedComment to KeypointsLib's keypointsNoteWithoutMetadataLines(processedComment, false)
		
		copy processedComment to end of recordContentParts
	end if
	
	if recordContentParts is not {} then
		set recordContents to KeypointsLib's mergeTextItems(recordContentParts, linefeed & linefeed)
	else
		set recordContents to "(no content)"
	end if
	
	return recordContents
end recordContentFromPDFAnnotationData


-- Assembles the name of a Markdown record from the given PDF annotation text,
-- comment and page label.
on recordNameFromPDFAnnotationData(annotText, annotComment, pageLabel)
	set recordNameParts to {}
	if pageLabel is not missing value and pageLabel is not "" then
		copy "p" & (pageLabel as string) to end of recordNameParts
	end if
	
	set recordNamePart to ""
	if annotComment is not missing value and annotComment is not "" then
		-- for the record's name, use any first-level heading (if there's one in the annotation's comment)
		set markdownHeadings to KeypointsLib's markdownHeadingsFromText(annotComment, "#")
		if markdownHeadings is not {} then
			set recordNamePart to heading of first item of markdownHeadings
		end if
		
		-- otherwise, use up to 12 words from the beginning of the "comment"
		if recordNamePart is "" then
			set annotComment to KeypointsLib's keypointsNoteWithoutMetadataLines(annotComment, true)
			set recordNamePart to KeypointsLib's firstWordsFromText(annotComment, 12)
		end if
	end if
	
	-- else use up to 12 words from the beginning of the "annotText" 
	if recordNamePart is "" then
		set recordNamePart to KeypointsLib's firstWordsFromText(annotText, 12)
		if recordNamePart is not "" then
			-- wrap the extracted text in quotes to indicate that it's quoted text (and not your own comment)
			set recordNamePart to "\"" & recordNamePart & "\""
		end if
	end if
	
	if recordNamePart is "" then set recordNamePart to "(untitled)"
	copy recordNamePart to end of recordNameParts
	
	if recordNameParts is not {} then
		set recordName to KeypointsLib's mergeTextItems(recordNameParts, ": ")
	else
		set recordName to "(untitled)"
	end if
	
	return recordName
end recordNameFromPDFAnnotationData


-- Creates a new (Markdown) record in DEVONthink with the given text & properties
-- and returns it. If an existing record with the same URL exists at the same location,
-- this record will get updated and returned instead.
-- Note that the actual return value is a list with two items with the first item being the
-- created/modified record and the second item being a boolean value indicating if the
-- returned record actually has been modified ('true') or not (`false`):
-- `{dtRecord, didUpdateNote}`
-- Credits: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on createDTRecord(folderLocation, folderMetadata, recordName, recordAliases, recordURL, recordTags, isFlagged, recordText, recordCreationDate, recordModificationDate, recordMetadata, recordRating, recordLabelIndex)
	tell application id "DNtp"
		set newRecordData to {type:markdown, content:recordText, name:recordName}
		
		if recordCreationDate is not missing value then
			set newRecordData to newRecordData & {creation date:recordCreationDate}
		end if
		
		if recordURL is not "" then
			set newRecordData to newRecordData & {URL:recordURL}
		end if
		
		if recordAliases is not "" then
			set newRecordData to newRecordData & {aliases:recordAliases}
		end if
		
		set aRecord to missing value
		set didCreateNote to false
		set didUpdateNote to false
		
		-- use any existing record with the same URL that exists at the same location
		set isExistingRecord to false
		if recordURL is not "" then
			set existingRecords to lookup records with URL recordURL
			if existingRecords is not {} then
				set targetLocation to location of folderLocation & name of folderLocation & "/"
				repeat with existingRecord in existingRecords
					if (aRecord is missing value) and (location of existingRecord = targetLocation) then
						set aRecord to existingRecord
						set isExistingRecord to true
					end if
				end repeat
			end if
		end if
		
		if aRecord is missing value then
			set aRecord to create record with newRecordData in folderLocation
			
			-- newly created Markdown notes inherit their notes folder's existing metadata & Finder comment
			set recordMetadata to recordMetadata & folderMetadata
			set aRecord's comment to folderLocation's comment
			
			set didCreateNote to true
			set createdNotesCount to createdNotesCount + 1
		end if
		
		if isExistingRecord is false or updateExistingNotes is true then
			if updateNameForExistingNotes is true then
				if name of aRecord ≠ recordName then
					set didUpdateNote to true
					set name of aRecord to recordName
				end if
			end if
			
			if updateTextContentForExistingNotes is true then
				if plain text of aRecord ≠ recordText then
					set didUpdateNote to true
					set plain text of aRecord to recordText
				end if
			end if
			
			if (isExistingRecord is false or updateModificationDateForExistingNotes is true) and recordModificationDate is not missing value then
				-- TODO: should we force update recordModificationDate when an existing record's property got updated?
				if modification date of aRecord ≠ recordModificationDate then
					set didUpdateNote to true
					set modification date of aRecord to recordModificationDate
				end if
			end if
			
			if isExistingRecord is false or updateFlaggedStatusForExistingNotes is true then
				if state of aRecord ≠ isFlagged then
					set didUpdateNote to true
					set state of aRecord to isFlagged
				end if
			end if
			
			if isExistingRecord is false or updateRatingForExistingNotes is true then
				if rating of aRecord ≠ recordRating then
					set didUpdateNote to true
					set rating of aRecord to recordRating
				end if
			end if
			
			if isExistingRecord is false or updateLabelForExistingNotes is true then
				if label of aRecord ≠ recordLabelIndex then
					set didUpdateNote to true
					set label of aRecord to recordLabelIndex
				end if
			end if
			
			if (isExistingRecord is false or updateTagsForExistingNotes is true) and recordTags is not {} then
				set existingRecordTags to tags of aRecord
				repeat with aTag in recordTags
					if aTag is not in existingRecordTags then set didUpdateNote to true
				end repeat
				set tags of aRecord to existingRecordTags & recordTags
			end if
			
			if (isExistingRecord is false or updateCustomMetadataForExistingNotes is true) then
				if (my updateMetadataForDTRecord(aRecord, recordMetadata)) then
					set didUpdateNote to true
				end if
			end if
			
			if didUpdateNote is true and didCreateNote is false then
				set updatedNotesCount to updatedNotesCount + 1
			end if
		end if
		
		return {aRecord, didUpdateNote}
	end tell
end createDTRecord


-- Sets the custom metadata of the given DEVONthink group.
-- @param folderLocation The DEVONthink group whose custom metadata shall be set.
-- @param folderMetadata The record of custom metadata that shall be set.
on setMetadataForDTFolder(folderLocation, folderMetadata)
	if updateCustomMetadataForExistingFolders is true and folderLocation is not missing value and folderMetadata is not missing value and folderMetadata is not {} then
		tell application id "DNtp" to set custom meta data of folderLocation to folderMetadata
	end if
end setMetadataForDTFolder


-- Sets the custom metadata of the given DEVONthink record.
-- @param aRecord The DEVONthink record whose custom metadata shall be set.
-- @param recordMetadata The record of custom metadata that shall be set.
on setMetadataForDTRecord(aRecord, recordMetadata)
	if aRecord is not missing value and recordMetadata is not missing value and recordMetadata is not {} then
		tell application id "DNtp" to set custom meta data of aRecord to recordMetadata
	end if
end setMetadataForDTRecord


-- Updates the custom metadata of the given DEVONthink record. Returns a boolean value indicating if the
-- given record actually has been modified ('true') or not (`false`).
-- @param aRecord The DEVONthink record whose custom metadata shall be updated.
-- @param recordMetadata The record of custom metadata that shall be set.
on updateMetadataForDTRecord(aRecord, recordMetadata)
	if aRecord is missing value or recordMetadata is missing value or recordMetadata is {} then return false
	
	set didUpdateNote to false
	
	tell application id "DNtp"
		set existingRecordMetadata to custom meta data of aRecord
		try
			-- existingRecordMetadata may be undefined in which case this triggers the error case
			if existingRecordMetadata is missing value then set existingRecordMetadata to {}
		on error
			set existingRecordMetadata to {}
		end try
		
		if existingRecordMetadata is not {} then
			set existingKeys to KeypointsLib's keysOfRecord:existingRecordMetadata
			set theKeys to KeypointsLib's keysOfRecord:recordMetadata
			
			-- NOTE: updating non-empty values for existing keys doesn't seem to work unless we clear the key's value or remove the key entirely
			repeat with theKey in theKeys
				set dtKey to my dtCustomMetadataIdentifierForName(theKey)
				
				if dtKey is in existingKeys then
					set theValue to (KeypointsLib's valueForKey:theKey inRecord:recordMetadata)
					set existingValue to (KeypointsLib's valueForKey:dtKey inRecord:existingRecordMetadata)
					
					if theValue ≠ existingValue then
						set didUpdateNote to true
						set existingRecordMetadata to (KeypointsLib's setValue:(missing value) forKey:dtKey inRecord:existingRecordMetadata)
					end if
				else
					set didUpdateNote to true
				end if
			end repeat
			
			set recordMetadata to KeypointsLib's addItemsFromRecord:recordMetadata toRecord:existingRecordMetadata
		end if
		
		set custom meta data of aRecord to recordMetadata
	end tell
	
	return didUpdateNote
end updateMetadataForDTRecord


-- Returns the metadata identifier name that DEVONthink would use in scripting contexts
-- for the given key name.
on dtCustomMetadataIdentifierForName(theKey)
	set dtKey to KeypointsLib's lowercaseText(theKey)
	set dtKey to KeypointsLib's regexReplace(dtKey, "\\s+", "")
	
	return "md" & dtKey
end dtCustomMetadataIdentifierForName


-- Appends the given string to the Finder comment of the given DEVONthink group.
on appendToCommentOfDTFolder(folderLocation, folderComment)
	if folderComment is not missing value and folderComment is not {} then
		set commentParts to {}
		tell application id "DNtp"
			set existingFolderComment to (comment of folderLocation)
			if existingFolderComment is not missing value and existingFolderComment is not "" then copy existingFolderComment to end of commentParts
			copy folderComment to end of commentParts
			
			set comment of folderLocation to KeypointsLib's mergeTextItems(commentParts, linefeed & linefeed)
		end tell
	end if
end appendToCommentOfDTFolder


-- Returns a record of bibliographic metadata for the given DOI (as fetched from OpenAlex.org),
-- ready to be used as custom metadata in DEVONthink.
-- @param doi The DOI for which bibliographic metadata shall be fetched.
-- @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which
-- case a default citekey will be used.
-- TODO: allow to specify which metadata shall get exported into which custom metadata field
on bibMetadataForDOI(doi, citekey)
	if doi is missing value or doi is "" then return {}
	
	set publicationData to KeypointsLib's metadataForDOI(doi, fetchBibTeX, fetchFormattedCitation, "apa", "en-GB", citekey)
	if publicationData is {} then return {}
	
	set bibMetadata to {}
	
	set pubAuthors to KeypointsLib's valueForKey:"authors" inRecord:publicationData -- single author: string, multiple authors: list
	if pubAuthors is not missing value and pubAuthors is not "" and pubAuthors is not {} then
		set bibMetadata to bibMetadata & {authors:(KeypointsLib's mergeTextItems(pubAuthors, linefeed))}
		
		set pubAuthorsCount to count of pubAuthors
		if pubAuthorsCount is 1 then
			set bibMetadata to bibMetadata & {author:first item of pubAuthors}
		else if pubAuthorsCount is 2 then
			set bibMetadata to bibMetadata & {author:first item of pubAuthors & " & " & second item of pubAuthors}
		else -- 3 or more
			set bibMetadata to bibMetadata & {author:first item of pubAuthors & " et al."}
		end if
	end if
	
	set pubDate to KeypointsLib's valueForKey:"date" inRecord:publicationData
	if pubDate is not missing value then set bibMetadata to bibMetadata & {|date|:pubDate as date}
	
	set pubPublisher to KeypointsLib's valueForKey:"publisher" inRecord:publicationData
	if pubPublisher is not missing value and pubPublisher is not "" then set bibMetadata to bibMetadata & {publisher:pubPublisher}
	
	set pubISSN to KeypointsLib's valueForKey:"issn" inRecord:publicationData
	if pubISSN is not missing value and pubISSN is not "" then set bibMetadata to bibMetadata & {|is?n|:pubISSN}
	
	set pubJournal to KeypointsLib's valueForKey:"journal" inRecord:publicationData
	if pubJournal is not missing value and pubJournal is not "" then set bibMetadata to bibMetadata & {journal:pubJournal}
	
	set pubVolume to KeypointsLib's valueForKey:"volume" inRecord:publicationData
	set pubIssue to KeypointsLib's valueForKey:"issue" inRecord:publicationData
	if pubVolume is not missing value and pubVolume is not "" then
		if pubIssue is not missing value and pubIssue is not "" then set pubVolume to pubVolume & "(" & pubIssue & ")"
		set bibMetadata to bibMetadata & {volume:pubVolume}
	end if
	
	set pubPages to KeypointsLib's valueForKey:"page" inRecord:publicationData
	if pubPages is not missing value and pubPages is not "" then set bibMetadata to bibMetadata & {page:pubPages}
	
	set pubCitation to KeypointsLib's valueForKey:"citation" inRecord:publicationData
	if pubCitation is not missing value and pubCitation is not "" then set bibMetadata to bibMetadata & {|reference|:pubCitation}
	
	set pubBibTeX to KeypointsLib's valueForKey:"bibtex" inRecord:publicationData
	if pubBibTeX is not missing value and pubBibTeX is not "" then set bibMetadata to bibMetadata & {bibtex:pubBibTeX}
	
	set pubLink to KeypointsLib's valueForKey:"url" inRecord:publicationData
	if pubLink is not missing value and pubLink is not "" then set bibMetadata to bibMetadata & {link:pubLink}
	
	set pubPMID to KeypointsLib's valueForKey:"pmid" inRecord:publicationData
	if pubPMID is not missing value and pubPMID is not "" then set bibMetadata to bibMetadata & {pmid:pubPMID}
	
	set pubPMCID to KeypointsLib's valueForKey:"pmcid" inRecord:publicationData
	if pubPMCID is not missing value and pubPMCID is not "" then set bibMetadata to bibMetadata & {pmcid:pubPMCID}
	
	return bibMetadata
end bibMetadataForDOI


-- Maps the given color name to a DEVONthink label index and returns it.
on labelIndexForColorName(colorName)
	if colorName is missing value or colorName is "" then return 0
	
	set recordLabelIndex to 0
	set labelMapping to (KeypointsLib's recordForKey:"colorName" andValue:colorName inListOfRecords:labelMappings)
	if labelMapping is not missing value then
		set recordLabelIndex to labelMapping's labelIndex
	end if
	
	return recordLabelIndex
end labelIndexForColorName


-- Returns the name of the approximate color (like "red", "blue", "green", etc) for the
-- given hue degree.
-- @param hueDegree A color's hue component given as a degree (0-359) of the hue 
-- in the HSB (hue, saturation, brightness) color scheme.
on colorNameForHue(hueDegree)
	set colorName to ""
	
	repeat with colorMapping in colorMappings
		if hueDegree ≥ colorMapping's lowerHueLimit and hueDegree ≤ colorMapping's upperHueLimit then
			set colorName to colorMapping's colorName
		end if
	end repeat
	if colorName is "" and (hueDegree ≥ colorMapping's lowerHueLimit or hueDegree ≤ colorMapping's upperHueLimit) then
		set colorName to redColorMapping's colorName
	end if
	
	return colorName
end colorNameForHue


-- Attempts to extract the annotation's text from its line-based bounds rectangles.
-- @param boundsByLine List of line-based bounds, where each bounds rectangle
-- specifies the bounding box of an annotation's individual line in page space.
on annotationText(pdfPage, boundsByLine)
	set textByLine to {}
	
	repeat with theBounds in boundsByLine
		set pdfSelection to (pdfPage's selectionForRect:theBounds)
		set lineText to pdfSelection's |string|()
		
		if lineText is not missing value and lineText is not "" then
			-- replace any trailing whitespace or "\n" at the end of a line with a single space
			set lineText to KeypointsLib's regexReplace(lineText as string, "(\\s+|\\\\n)$", " ")
			
			-- assume that a hyphen (and optional space) at the end of a line indicates a word hyphenation
			-- NOTE: while this assumption is often correct, it's not always true so it may incorrectly merge
			--           hyphenated words
			set lineText to KeypointsLib's regexReplace(lineText, "- $", "")
			
			copy lineText to end of textByLine
		end if
	end repeat
	
	return KeypointsLib's mergeTextItems(textByLine, "")
end annotationText


-- Return's the annotation's color & approximate color name.
-- Note that the actual return value is a list with two items with the first item being
-- the annotation's color (specified as a NSColor object) and the second item being
-- the color's approximate color name (like "red", "blue", "green", etc):
-- `{annotColor, annotColorName}`
on colorForAnnotation(pdfAnnotation)
	if pdfAnnotation is missing value then return {missing value, ""}
	
	set annotColor to missing value
	set annotColorName to ""
	set annotType to pdfAnnotation's |type|()
	set annotKeyDict to pdfAnnotation's annotationKeyValues()
	
	if (annotType as string) is in {"FreeText"} then
		set defaultStyle to (annotKeyDict's valueForKey:"/DS") as string -- e.g.: NSString "font-family: Helvetica; font-size: 12pt; color: #FF4015"
		if defaultStyle is not missing value then
			set hexColorString to KeypointsLib's regexMatch(defaultStyle, "#[0-9A-F]{6}")
			if hexColorString is not "" then
				set {theRed, theGreen, theBlue} to (KeypointsLib's RGBColorFromHexColor:hexColorString)
				set annotColor to (current application's NSColor's colorWithRed:theRed / 255 green:theGreen / 255 blue:theBlue / 255 alpha:1.0)
			end if
		else -- if "/DS" isn't available fallback to "/DA"
			set defaultAppearance to (annotKeyDict's valueForKey:"/DA") as string -- e.g.: NSString "/Helvetica 12 Tf 1.000 0.251 0.082 rg"
			if defaultAppearance is not missing value then
				set colorRegex to ".*? (\\d+\\.\\d+) (\\d+\\.\\d+) (\\d+\\.\\d+).*"
				if (KeypointsLib's regexMatch(defaultAppearance, colorRegex)) is not "" then
					set theRed to KeypointsLib's regexReplace(defaultAppearance, colorRegex, "$1")
					set theGreen to KeypointsLib's regexReplace(defaultAppearance, colorRegex, "$2")
					set theBlue to KeypointsLib's regexReplace(defaultAppearance, colorRegex, "$3")
					set annotColor to (current application's NSColor's colorWithRed:theRed green:theGreen blue:theBlue alpha:1.0)
				end if
			end if
		end if
	else
		set annotColor to pdfAnnotation's |color|()
	end if
	
	if annotColor is not missing value then
		if annotColor's colorSpace is not (current application's NSColorSpace's deviceRGBColorSpace()) then
			set annotColor to (annotColor's colorUsingColorSpace:(current application's NSColorSpace's deviceRGBColorSpace()))
		end if
		
		-- approximate the name of the annotation's color via the degree of the hue in the HSB (hue, saturation, brightness) color scheme
		set hueDegree to round ((annotColor's hueComponent() as number) * 360) rounding as taught in school
		set annotColorName to my colorNameForHue(hueDegree)
	end if
	
	return {annotColor, annotColorName}
end colorForAnnotation


-- Converts a list of quadrilateral points to a list of line-based bounds, where each bounds
-- rectangle specifies the bounding box of an annotation's individual line in page space.
-- @param quadPoints List of quadrilateral points (as obtained by `pdfAnnotation's quadrilateralPoints()`,
-- with each point wrapped as NSValue object) where each quadrilateral (i.e., a group of four consecutive
-- points ordered in Z-form {topLeft, topRight, bottomLeft, bottomRight} so that points with higher
-- y-values come first) encircles a line of text to be highlighted. The coordinates of each point are relative
-- to the bound’s origin of the markup annotation.
-- @param annotationBounds The bounding box for the annotation in page space (which is a 72 dpi
-- coordinate system with the origin at the lower-left corner of the PDF page), as obtained by
-- `pdfAnnotation's |bounds|()`.
on annotationBoundsByLine(quadPoints, annotationBounds)
	set theOrigin to first item of annotationBounds -- a point specified as a list of x/y positions: {xPos, YPos}
	set boundsByLine to {}
	set maxQuadCount to (count of quadPoints) / 4
	set quadCount to 1
	
	-- iterate over each quadrilateral (4 points: topLeft, topRight, bottomLeft, bottomRight) representing an
	-- annotation line and get its bounds in page space
	repeat maxQuadCount times
		-- get the top left & bottom right quad points for this annotation line
		set topLeftPoint to (item quadCount of quadPoints)'s pointValue()
		set bottomRightPoint to (item (quadCount + 3) of quadPoints)'s pointValue()
		
		-- convert each quad point (whose coordinates are relative to the bound’s origin of the markup
		-- annotation) to page space (where the origin lies at the lower-left corner of the PDF page)
		-- NOTE: w/o the adjustment of values, the rectangle would be too small to match underlying text
		set x of topLeftPoint to (x of topLeftPoint) + (first item of theOrigin) - lineWidthEnlargement
		set y of topLeftPoint to (y of topLeftPoint) + (second item of theOrigin) + lineHeightEnlargement
		
		set x of bottomRightPoint to (x of bottomRightPoint) + (first item of theOrigin) + lineWidthEnlargement
		set y of bottomRightPoint to (y of bottomRightPoint) + (second item of theOrigin) - lineHeightEnlargement
		
		-- create a bounds rectangle (specified by origin {x,y} & size {width,height}) for this annotation line
		set lineBounds to my makeNSRect({{x of topLeftPoint, y of topLeftPoint}, {x of bottomRightPoint, y of bottomRightPoint}})
		copy lineBounds to end of boundsByLine
		
		set quadCount to quadCount + 4
	end repeat
	
	return boundsByLine
end annotationBoundsByLine


-- Takes a a rectangle specified via its top left & bottom right points (given as a list of lists:
-- {{topLeftX, topLeftY}, {bottomRightX, bottomRightY}}) and converts it to a bounds rectangle
-- given as a record with `origin` & `size` properties each containing again a record:
-- {origin:{x:topLeftX, y:topLeftY}, |size|:{width:bottomRightX-topLeftX, height:bottomRightY-topLeftY}} 
-- Credits: by Takaaki Naganoya, Piyomaru Software (see http://piyocast.com/as/archives/643)
on makeNSRect(aList as list)
	try
		copy aList to {{x1, y1}, {x2, y2}}
		set xWidth to (x2 - x1)
		set yHeight to (y2 - y1) -- TODO: doesn't this create a negative height? use `y1 - y2` instead?
		set a1Rect to {origin:{x:x1, y:y1}, |size|:{width:xWidth, height:yHeight}}
		return a1Rect
	on error
		return missing value
	end try
end makeNSRect


-- This method serves as a hook which gets called for every annotation with an annotation comment.
-- It can be used to transform the given annotation comment (which may contain custom markup syntax)
-- into a Keypoints-style format that's supported by this script.
on preprocessAnnotationComment(aComment)
	return aComment -- comment out this line (i.e., prefix it with "--") if you want to use custom code below
	
	-- NOTE: below code is just an example that shows how you could transform the given annotation
	--           comment so that it matches the Keypoints-style format used by this script.
	
	-- convert tags
	-- - input: an annotation comment containing a separate line that starts with “Tags:” followed by
	--             comma-separated values that represent the tags, e.g.: "Tags: some tag, another tag, test"
	-- - output: an annotation comment containing a Keypoints-style metadata line with tags,
	--             e.g.: "< @some tag @another tag @test"
	set transformedLines to {}
	set tagsLineRegex to "(?<=^|[\\r\\n])Tags:\\s*"
	set tagDelimiterRegex to "(?<=^<|[\\r\\n]<)\\s+|\\s*,\\s*"
	
	repeat with aLine in paragraphs of aComment
		if (KeypointsLib's regexMatch(aLine, tagsLineRegex)) is not "" then
			set aLine to KeypointsLib's regexReplace(aLine, tagsLineRegex, "< ")
			set aLine to KeypointsLib's regexReplace(aLine, tagDelimiterRegex, " @")
		end if
		copy aLine as text to end of transformedLines
	end repeat
	
	set transformedString to KeypointsLib's mergeTextItems(transformedLines, linefeed) & linefeed
	
	return transformedString
end preprocessAnnotationComment
