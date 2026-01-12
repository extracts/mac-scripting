-- DEVONthink Notes to Tinderbox
-- version 1.0, licensed under the MIT license

-- by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

-- Exports all records selected in your frontmost DEVONthink database window
-- as individual notes to Tinderbox.

-- This script requires macOS 10.14 (High Sierra) or greater, the KeypointsScriptingLib v1.5
-- or greater, DEVONthink Pro 3.8.3 or greater, and Tinderbox 9.3.0 or greater.


-- Setup:

-- -- Before running the script, do this once: Adjust the DEVONthink label <-> color mapping via the
--     properties `label1` ... `label7` below and save this script again. If saving generates an error, please
--     try again with Script Debugger (which is freely available): https://latenightsw.com/sd8/download/

-- -- You may also want to check the other properties below. These allow to customize the script, e.g. to
--     enable updating of existing notes, or to specify one of your existing prototypes for the created notes.

-- -- To install the script, copy it to a suitable place, like the DEVONthink Scripts folder. To open this folder, activate
--     DEVONthink, select the Scripts menu(*) and choose "Open Scripts Folder". This will open the DEVONthink
--     Scripts folder in the Finder. It is located at `~/Library/Application Scripts/com.devon-technologies.think3/Menu`.
--     (*): https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/menus-scripts.html

--     Alternatively, you can copy the script to the system's script menu folder. For a guide on how to enable
--     and use the system's script menu, see: https://iworkautomation.com/numbers/script-menu.html

-- -- If you've placed your script into the DEVONthink script folder, you may also append a keyboard shortcut
--     description (like `___Command-Shift-Alt-T`) to the script's name. After restarting DEVONthink, you
--     should be able to run your script via the specified keyboard shortcut.


-- Usage:

-- -- Before executing the app, make sure that your DEVONthink and Tinderbox apps are running, and that
--     you've selected all records in your DEVONthink database window that you'd like to export to Tinderbox.
--     Note that for any selected group(s), its direct children will get added to your list of selected records.
--     I.e. you can simply select a group if you want to export all of its contained (non-group) records.

--     Now run the script to start the export process: To run the script, select its menu entry from the
--     (DEVONthink or system's) script menu, or press your specified keyboard shortcut.

--    For each group hosting your selected DEVONthink record(s), the script will create a note container within
--    a top-level container inside your front Tinderbox document, and populate it with Markdown notes for each
--    of your DEVONthink records.

-- -- After the script has finished, you'll see a dialog with feedback on how many groups have been processed,
--     how many Tinderbox notes have been created/updated, and how many links between these notes have
--     been established.

-- -- Note that you can run the script multiple times for the same DEVONthink record(s) without creating
--     duplicate notes in Tinderbox. If the property `dtUpdateExistingNotes` is set to true (it is set
--     to true by default), the existing Tinderbox notes will get updated. This may be useful if you want
--     to update, say, the note text, rating or label color for existing notes.


-- Discussion & Help:

-- -- https://github.com/extracts/mac-scripting/discussions


-- ----------- you may edit the values of the properties below ------------------


-- Maps DEVONthink label indexes to label & color names. Please set the `labelName` & `colorName` values
-- according to the label <-> color mapping that you've chosen in your DEVONthink Settings under "Color".
-- E.g., if your DEVONthink "Color" settings specify a redish color with the name "Important" for the first label,
-- then use `{labelIndex:1, labelName:"Important", colorName:"red"}`. Note that each label must have a
-- unique color name. Available color names: red, orange, yellow, green, cyan, light blue, dark blue, purple, pink.
-- If necessary, you can define the exact hues further below.
-- TODO: skip `colorName` and directly define a `hexColor` instead? (dealing just with color names may feel easier, though)
property label1 : {labelIndex:1, labelName:"Important", colorName:"red"}
property label2 : {labelIndex:2, labelName:"Done", colorName:"green"}
property label3 : {labelIndex:3, labelName:"TODO", colorName:"light blue"}
property label4 : {labelIndex:4, labelName:"Default", colorName:"yellow"}
property label5 : {labelIndex:5, labelName:"Checkout", colorName:"orange"}
property label6 : {labelIndex:6, labelName:"Read", colorName:"dark blue"}
property label7 : {labelIndex:7, labelName:"Overview", colorName:"purple"}

-- The name of the root-level container note that will host all notes exported to Tinderbox.
property tbMainContainerName : "DEVONthink"

-- Placeholder format used to generate the names of the Tinderbox container notes representing exported
-- DEVONthink groups. Placeholder format syntax:
-- -- Placeholders start with '<' and end with '>' and the actual placeholder name is enclosed with colons (':').
--     Supported placeholders:
--         <:NAME:>, <:CITEKEY:>, <:AUTHOR:>, <:YEAR:>, <:JOURNAL:>, <:VOLUME:>, <:ISSUE:>, <:PAGE:>,
--         <:DOI:>, <:PMID:>, <:PMCID:>, <:ANNOTATIONTYPE:>, <:ANNOTATIONPAGE:>, <:ANNOTATIONORDER:>
-- -- You can use literal text between placeholders. Example:
--         "<:NAME:> — <:CITEKEY:>"
-- -- The placeholder syntax also allows for prefix & suffix strings which will only get included if a given
--     placeholder isn't empty:
--     - An optional prefix can be inserted between the opening angle bracket ('<') and the first colon (':').
--     - An optional suffix can be inserted between the second colon (':') and the closing angle bracket ('>').
--       Examples:
--         "<:NAME:>< — :AUTHOR:>< (:YEAR:)>"
--         "<:NAME:>< — :JOURNAL:>< :VOLUME:><(:ISSUE:)>< p.:PAGE:>"
property tbGroupContainerNameFormat : "<:NAME:>"

-- Name of the Tinderbox prototype that will be created & assigned to the created Tinderbox container notes.
property tbGroupContainerPrototypeName : "pReference-DEVONthink"

-- List of attributes to be used as displayed attributes for the above container notes prototype.
property tbGroupContainerPrototypeDisplayedAttributes : "Flagged;Color;DEVONthinkLabel;RatingString;Tags;Citekey;ReferenceURL;SourceURL;SourceFile;URL"

-- Name of the existing Tinderbox prototype that will be assigned to the above container notes prototype.
-- NOTE: If you enter a name for an existing Tinderbox prototype here, please ensure that your Tinderbox
--           document actually contains the specified prototype.
property tbGroupContainerPrototypePrototypeName : "Reference"

-- Placeholder format used to generate the names of the Tinderbox notes representing exported DEVONthink
-- records. For the placeholder format syntax, see `tbGroupContainerNameFormat` above.
property tbNoteNameFormat : "<:NAME:>"

-- Name of the Tinderbox prototype that will be created & assigned to the created Tinderbox notes.
property tbNotePrototypeName : "pMarkdown-DEVONthink"

-- List of attributes to be used as displayed attributes for the above notes prototype.
property tbNotePrototypeDisplayedAttributes : "Flagged;Color;DEVONthinkLabel;AnnotationType;RatingString;Tags;AnnotationPage;Citekey;SourceURL;URL"

-- Name of the existing Tinderbox prototype that will be assigned to the above notes prototype.
-- NOTE: If you enter a name for an existing Tinderbox prototype here, please ensure that your Tinderbox
--           document actually contains the specified prototype.
property tbNotePrototypePrototypeName : "Markdown"

-- Specifies whether any existing Tinderbox notes shall get updated on subsequent script runs (true)
-- or not (false). This may be useful if you want to update, say, the note text, rating or label color for
-- existing notes.
property dtUpdateExistingNotes : true

-- Specifies whether any existing user attributes of existing Tinderbox notes shall be cleared on
-- subsequent script runs (true) or not (false) before populating these again.
property dtClearUserAttributesBeforeUpdatingExistingNotes : false


-- ----------- usually, you don't need to edit anything below this line -----------


property exportedRecordsCount : 0

-- Defines hex colors in the HSB (hue, saturation, brightness) color scheme for color names supported by this script.
-- While not required, you may adopt the hex values to better suit your taste or needs.
property redColor : {colorName:"red", hexColor:"#FB0007"}
property orangeColor : {colorName:"orange", hexColor:"#FC7408"}
property yellowColor : {colorName:"yellow", hexColor:"#FECC0A"}
property greenColor : {colorName:"green", hexColor:"#1FE905"}
property cyanColor : {colorName:"cyan", hexColor:"#21C5C2"}
property lightBlueColor : {colorName:"light blue", hexColor:"#18BDFF"}
property darkBlueColor : {colorName:"dark blue", hexColor:"#1A00F0"}
property purpleColor : {colorName:"purple", hexColor:"#963BEF"}
property pinkColor : {colorName:"pink", hexColor:"#EE00DC"}

property dtColors : {redColor, orangeColor, yellowColor, greenColor, cyanColor, lightBlueColor, darkBlueColor, purpleColor, pinkColor}

property labelMappings : {label1, label2, label3, label4, label5, label6, label7}

-- Defines a replacement character that'll be used in Tinderbox note names instead of the
-- forward slash as Tinderbox uses forward slashes as a path separators.
property replacementStringForForwardSlashInDTNames : "|"

-- The date when this script was last run successfully, will be set automatically.
-- This date will be used to populate (or update) the Tinderbox user attribute "LastImported".
property lastRunDate : (current date)

-- The "KeypointsScriptingLib.scptd" scripting library provides utility methods for this script.
-- It can be made available to this script by copying it into a "Script Libraries" folder inside
-- the "Library" folder that's within your Home folder.
-- see https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib
use KeypointsLib : script "KeypointsScriptingLib"
use scripting additions

-- TODO: offer an option to suppress the success feedback dialog
-- TODO: offer a separate option that allows to prevent changing of DisplayedAttributes for prototypes that already exist in the Tinderbox document
-- TODO: allow to specify which metadata shall get exported into which Tinderbox user attribute
-- TODO: also transfer AnnotationOrder, PMID & PMCID from a DT record's custom metadata?

-- main routine
on run
	-- Tinderbox and DEVONthink must be running for this script to work
	if not my checkAppsRunning() then return
	
	-- check there are open documents in Tinderbox & DEVONthink
	my ensureOpenDocuments()
	
	-- only deal with the currently selected records (but include any group's direct children)
	-- NOTE: groups in the selection will be resolved so that their first-level children will be processed instead;
	--           if these first-level children contain any groups, these will be ignored (so there's no further traversal
	--           of the group hierarchy)
	set selectedRecords to my selectedDEVONthinkRecords()
	set selectedRecords to my DEVONthinkRecordsWithGroupChildren(selectedRecords)
	set groupIDs to my uniqueGroupIDsFromDEVONthinkRecords(selectedRecords)
	
	-- create the main top-level container in Tinderbox
	set mainTinderboxContainer to my setupMainTinderboxContainer()
	
	-- create required prototypes & user attributes in Tinderbox
	my setupTinderboxPrototypes()
	my setupTinderboxUserAttributes()
	
	set lastRunDate to current date
	set exportedRecordsCount to 0
	set groupCount to count of groupIDs
	
	-- export DEVONthink groups as Tinderbox container notes
	set tbGroupContainerPathsByGroupID to my exportDEVONthinkGroupsToTinderbox(mainTinderboxContainer, groupIDs)
	
	-- export DEVONthink records as Tinderbox notes
	set createdNotes to my exportDEVONthinkRecordsToTinderbox(mainTinderboxContainer, tbGroupContainerPathsByGroupID, selectedRecords)
	
	-- create links between Tinderbox notes that mimic the links between DEVONthink note records
	set createdLinks to my createTinderboxLinksForDEVONthinkRecords(selectedRecords)
	set linkCount to count of createdLinks
	
	tell application id "Cere"
		activate
		display dialog "Imported groups: " & groupCount & ¬
			linefeed & "Imported records: " & exportedRecordsCount & ¬
			linefeed & "Created links: " & linkCount ¬
			with title "Finished Import From DEVONthink" with icon 2 buttons {"OK"} default button "OK"
	end tell
end run


-- Checks if Tinderbox and DEVONthink are running.
-- Credit: modified after script code by Rob Trew
-- see https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript
on checkAppsRunning()
	tell application id "sevs" -- application "System Events"
		if (count of (processes where creator type = "Cere")) < 1 then
			KeypointsLib's displayError("Tinderbox not running!", "Please launch Tinderbox and open a Tinderbox document, then run this script again.", 15, true)
			return false
		end if
		if (count of (processes where creator type = "DNtp")) < 1 then
			KeypointsLib's displayError("DEVONthink not running!", "Please open a DEVONthink database and select some note record(s), then run this script again.", 15, true)
			return false
		end if
	end tell
	return true
end checkAppsRunning


-- Ensures that there are documents opened in Tinderbox & DEVONthink.
-- If there is currently no open document in Tinderbox or DEVONthink,
-- presents an error alert and aborts the script.
on ensureOpenDocuments()
	if not my existsOpenDEVONthinkDocument() then KeypointsLib's displayError("No open DEVONthink database!", "Please open a DEVONthink database and select some note record(s).", 15, true)
	if not my existsOpenTinderboxDocument() then KeypointsLib's displayError("No open Tinderbox document!", "Please open the Tinderbox document that shall receive the DEVONthink note records.", 15, true)
end ensureOpenDocuments


-- Returns true if there's at least one database opened
-- in DEVONthink, otherwise false.
on existsOpenDEVONthinkDocument()
	tell application id "DNtp" to set dbWindows to viewer windows
	return dbWindows is not {}
end existsOpenDEVONthinkDocument


-- Returns true if there's at least one document opened
-- in Tinderbox, otherwise false.
on existsOpenTinderboxDocument()
	tell application id "Cere" to set tbDocs to documents
	return tbDocs is not {}
end existsOpenTinderboxDocument


-- Returns all records selected in the frontmost DEVONthink database window.
-- If the frontmost DEVONthink database window currently contains no selected records,
-- presents an error alert and aborts the script.
on selectedDEVONthinkRecords()
	tell application id "DNtp"
		tell front viewer window
			set selRecords to selected records
			if selRecords is {} then KeypointsLib's displayError("No DEVONthink records selected!", "Please select some record(s) or their group(s) in DEVONthink.", 15, true)
		end tell
	end tell
	
	return selRecords
end selectedDEVONthinkRecords


-- Replaces any group record(s) in the given list of records with the group's direct
-- (non-group) children and returns the resulting list of records.
on DEVONthinkRecordsWithGroupChildren(dtRecords)
	tell application id "DNtp"
		tell front viewer window
			set recordList to {}
			set recordIDs to {}
			
			repeat with dtRecord in dtRecords
				if type of dtRecord is group then
					set childRecords to (children of dtRecord whose type is not group) as list
					repeat with childRecord in childRecords
						set {recordList, recordIDs} to my addDEVONthinkRecordIfUnseen(childRecord, recordList, recordIDs)
					end repeat
				else
					set {recordList, recordIDs} to my addDEVONthinkRecordIfUnseen(dtRecord, recordList, recordIDs)
				end if
			end repeat
		end tell
	end tell
	
	return recordList
end DEVONthinkRecordsWithGroupChildren


-- Adds the DEVONthink record given in `dtRecord` to the given `recordList` if the
-- given `recordIDs` list doesn't yet contain its UUID, and returns both updated lists.
on addDEVONthinkRecordIfUnseen(dtRecord, recordList, recordIDs)
	if dtRecord is missing value then return {recordList, recordIDs}
	
	tell application id "DNtp" to set recordID to uuid of dtRecord as string
	
	if recordID is not in recordIDs then
		set recordList to recordList & {dtRecord}
		copy recordID to end of recordIDs
	end if
	
	return {recordList, recordIDs}
end addDEVONthinkRecordIfUnseen


-- Returns all unique groups associated with the given DEVONthink records.
on uniqueGroupIDsFromDEVONthinkRecords(dtRecords)
	if dtRecords is {} then return {}
	
	tell application id "DNtp"
		set groupIDs to {}
		repeat with dtRecord in dtRecords
			set dtGroup to my firstGroupParentForDEVONthinkRecord(dtRecord)
			if dtGroup is not missing value then
				copy uuid of dtGroup as string to end of groupIDs
			end if
		end repeat
		set groupIDs to KeypointsLib's uniqueObjectsInList:groupIDs
	end tell
	
	return groupIDs
end uniqueGroupIDsFromDEVONthinkRecords


-- Returns the first regular group that's a parent of the given DEVONthink record.
on firstGroupParentForDEVONthinkRecord(dtRecord)
	if dtRecord is missing value then return missing value
	
	set dtParent to missing value
	
	tell application id "DNtp"
		set dtParents to (every parent of dtRecord whose tag type is no tag)
		if dtParents is not missing value and dtParents is not {} then
			set dtParent to first item of dtParents
		end if
	end tell
	
	return dtParent
end firstGroupParentForDEVONthinkRecord


-- Creates & returns a new Tinderbox container note at the top-level of the Tinderbox document.
on setupMainTinderboxContainer()
	return my createTinderboxNoteInContainerPath("", tbMainContainerName, "", "", {})
end setupMainTinderboxContainer


-- Creates the prototypes used for group container notes & regular notes
on setupTinderboxPrototypes()
	set prototypeRecords to {¬
		{pName:tbGroupContainerPrototypeName, pContainerName:tbGroupContainerPrototypePrototypeName, pDislayedAttributes:tbGroupContainerPrototypeDisplayedAttributes}, ¬
		{pName:tbNotePrototypeName, pContainerName:tbNotePrototypePrototypeName, pDislayedAttributes:tbNotePrototypeDisplayedAttributes}}
	
	repeat with aRecord in prototypeRecords
		set theName to pName of aRecord
		set containerName to pContainerName of aRecord
		set displayedAttributes to pDislayedAttributes of aRecord
		set thePath to "Prototypes/" & containerName
		set theAttributes to {{attribKey:"IsPrototype", attribValue:true}, {attribKey:"DisplayedAttributes", attribValue:displayedAttributes}}
		my createTinderboxNoteInContainerPath(thePath, theName, "", containerName, theAttributes)
	end repeat
end setupTinderboxPrototypes


-- Creates specifications for any Tinderbox user attributes required by this script.
on setupTinderboxUserAttributes()
	set attributeRecords to {¬
		{attribName:"Citation", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"Citekey", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"Flagged", attribType:"boolean", attribDefaultValue:"false"}, ¬
		{attribName:"Rating", attribType:"number", attribDefaultValue:""}, ¬
		{attribName:"RatingString", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"DEVONthinkType", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"SourceFile", attribType:"file", attribDefaultValue:""}, ¬
		{attribName:"AnnotationType", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"AnnotationPage", attribType:"string", attribDefaultValue:""}, ¬
		{attribName:"LastImported", attribType:"date", attribDefaultValue:"now"}}
	
	repeat with aRecord in attributeRecords
		my createTinderboxUserAttribute(attribName of aRecord, attribType of aRecord, attribDefaultValue of aRecord, "")
	end repeat
end setupTinderboxUserAttributes


-- Returns a new or matching Tinderbox note at the given container path.
-- Pass an empty string for `containerPath` to specify the top-level container path.
-- If the given container path doesn't exist, creates the note at the top-level of the
-- Tinderbox document. If the note to be created already exists, returns the existing note.
on createTinderboxNoteInContainerPath(containerPath, noteName, noteText, prototypeName, noteAttributes)
	-- TODO: for the top-level container, allow to create "top" (`before first note`) or "bottom" (`after last note`)
	
	tell application id "Cere"
		tell front document
			-- setup target container
			set topLevelContainer to it -- the front document itself
			set theContainer to find note in topLevelContainer with path containerPath
			if theContainer is missing value then
				set theContainer to topLevelContainer
			end if
			
			-- find or create note
			if noteName is "" or noteName is missing value then set noteName to "Untitled Note"
			set theNote to my createTinderboxNoteInContainer(theContainer, noteName, noteText, prototypeName, noteAttributes, dtUpdateExistingNotes)
			
			return theNote
		end tell
	end tell
end createTinderboxNoteInContainerPath


-- Returns a new or matching Tinderbox note at the given container note.
-- - `theContainer` must be a valid reference to a Tinderbox (container) note
-- - `noteAttributes` must be a list of records where each record has the form: {attribKey:"ATTRIBUTE_NAME", attribValue:ATTRIBUTE_VALUE}
on createTinderboxNoteInContainer(theContainer, noteName, noteText, prototypeName, noteAttributes, updateExistingNotes)
	tell application id "Cere"
		tell front document
			tell theContainer
				if not (exists note noteName) then
					-- create note
					set theNote to make new note at theContainer
					
					-- set note attributes
					my updateTinderboxNote(theNote, noteName, noteText, prototypeName, noteAttributes)
				else
					set theNote to note noteName
					
					if (updateExistingNotes is true) then
						-- update note attributes
						my updateTinderboxNote(theNote, noteName, noteText, prototypeName, noteAttributes)
					end if
				end if
			end tell
			
			refresh theNote
			
			return theNote
		end tell
	end tell
end createTinderboxNoteInContainer


-- Updates the given Tinderbox note.
-- - `theNote` must be a valid reference to a Tinderbox note
-- - `noteAttributes` must be a list of records where each record has the form: {attribKey:"ATTRIBUTE_NAME", attribValue:ATTRIBUTE_VALUE}
on updateTinderboxNote(theNote, noteName, noteText, prototypeName, noteAttributes)
	tell application id "Cere"
		tell front document
			set text of theNote to noteText
			
			tell theNote
				set name to noteName
				
				-- add prototype
				if prototypeName is not "" and prototypeName is not missing value then
					set value of attribute "Prototype" to prototypeName
				end if
				
				-- clear attributes
				if dtClearUserAttributesBeforeUpdatingExistingNotes is true then
					repeat with anAttribute in user attributes
						delete value of anAttribute
					end repeat
				end if
				
				-- add attributes
				if noteAttributes is not {} then
					repeat with attributeRecord in noteAttributes
						try
							set value of attribute (attribKey of attributeRecord) to (attribValue of attributeRecord)
						on error theError
							my createTinderboxUserAttribute(attribKey of attributeRecord, "", "", attribValue of attributeRecord)
							set value of attribute (attribKey of attributeRecord) to (attribValue of attributeRecord)
						end try
					end repeat
				end if
			end tell
		end tell
	end tell
end updateTinderboxNote


-- Creates the given Tinderbox user attribute.
-- - `attribType` may be any of the following case-sensitive string values: string, color, number, file, boolean, date, set, URL, list, interval
-- - if `attribType` is empty, `attribValue` will be used to infer an appropriate type
on createTinderboxUserAttribute(attribName, attribType, attribDefaultValue, attribValue)
	tell application id "Cere"
		tell front document
			set allowedTypes to {"string", "color", "number", "file", "boolean", "date", "set", "URL", "list", "interval"}
			
			if attribType is not in allowedTypes and attribValue is not "" and attribValue is not missing value then
				if (KeypointsLib's regexReplace(attribValue, "^#[0-9A-F]{6}$", "__MATCH__") is equal to "__MATCH__") then
					set attribType to "color"
				else if (KeypointsLib's regexReplace(attribValue, "^(true|false)$", "__MATCH__") is equal to "__MATCH__") then
					set attribType to "boolean"
				else if (KeypointsLib's regexReplace(attribValue, "^(https?|ftp)://\\S+$", "__MATCH__") is equal to "__MATCH__") then
					set attribType to "URL"
				else if (KeypointsLib's regexReplace(attribValue, "^\\d+$", "__MATCH__") is equal to "__MATCH__") then
					set attribType to "number"
				else if (KeypointsLib's fileExistsAtFilePath(attribValue) is true) then
					set attribType to "file"
				else if (KeypointsLib's regexReplace(attribValue, "^[^;\\n]+(;[^;\\n]+)+$", "__MATCH__") is equal to "__MATCH__") then
					set attribType to "set"
				else if (KeypointsLib's regexReplace(attribValue, "^\\d{1,2}[./]\\d{1,2}[./]\\d{2,4}, \\d{1,2}:\\d{1,2}$", "__MATCH__") is equal to "__MATCH__") then -- 13.07.24, 20:00
					set attribType to "date" -- TODO: sniffing for date types should be smarter
				else
					set attribType to "string"
				end if
			end if
			
			if attribName is not "" and attribName is not missing value and attribType is in allowedTypes then
				-- NOTE: if a user attribute already exists with the designated name, the existing attribute is modified;
				--           if a system attribute already exists with the same name, no changes are made and no attribute is created.
				--           (see https://www.acrobatfaq.com/atbref8/index/SyntaxLibrary/Applescript.html)
				set userAttribute to make new attribute with properties {name:attribName, type:attribType, defaultValue:attribDefaultValue}
				
				return userAttribute
			end if
			
			return missing value
		end tell
	end tell
end createTinderboxUserAttribute


-- Creates container notes in Tinderbox for the groups of the given DEVONthink group UUIDs.
-- Returns a list of records that map Tinderbox container notes to DEVONthink group UUIDs.
on exportDEVONthinkGroupsToTinderbox(mainTinderboxContainer, dtUUIDs)
	if dtUUIDs is {} then return {}
	
	tell application id "DNtp"
		tell front viewer window
			set groupCount to count of dtUUIDs
			KeypointsLib's setupProgress("Exporting groups for selected DEVONthink records to Tinderbox…")
			KeypointsLib's setTotalStepsForProgress(groupCount)
			set groupContainerPathsByGroupUUID to {}
			
			repeat with i from 1 to groupCount
				set groupUUID to item i of dtUUIDs
				set groupRecord to my devonthinkRecordWithUUID(groupUUID)
				if groupRecord is missing value then
					KeypointsLib's logToSystemConsole(name of me, "Couldn't create container note in Tinderbox since no DEVONthink group was found for UUID \"" & groupUUID & "\".")
					return
				end if
				
				KeypointsLib's updateProgress(i, "Exporting group " & i & " of " & groupCount & " (\"" & name of groupRecord & "\").")
				
				set groupContainer to my createTinderboxNoteForDEVONthinkGroup(groupRecord, mainTinderboxContainer)
				
				if groupContainer is not missing value then
					-- remember which groupContainer maps to which group ID
					tell application id "Cere"
						set groupContainerPath to value of attribute "Path" of groupContainer
						copy {tbGroupContainerPath:groupContainerPath, dtGroupUUID:groupUUID} to end of groupContainerPathsByGroupUUID
					end tell
				else
					KeypointsLib's logToSystemConsole(name of me, "Couldn't export group \"" & groupTitle & "\" since its container note could not be created in Tinderbox.")
				end if
			end repeat
		end tell
	end tell
	
	return groupContainerPathsByGroupUUID
end exportDEVONthinkGroupsToTinderbox


-- Creates a new Tinderbox container note for the given DEVONthink group record.
on createTinderboxNoteForDEVONthinkGroup(dtGroupRecord, tbGroupContainer)
	if dtGroupRecord is missing value then return missing value
	
	-- gather info for this group
	-- NOTE: we assume here that the DEVONthink group's URL contains the URL to a source PDF,
	--           as is the case with the output from the "DEVONthink Notes from PDF Annotations" script
	--           where a group folder contains all annotations for a given source PDF
	tell application id "DNtp"
		tell front viewer window
			set {groupTitle, pubSourceURL, devonthinkUUID, pubKeywords, groupCreationDate, groupModificationDate, recordType, groupLabelIndex, groupRatingNumber, groupIsFlagged} to {name, URL, uuid, tags, creation date, modification date, type, label, rating, state} of dtGroupRecord
		end tell
	end tell
	
	set recordMetadata to my customMetadataForDEVONthinkRecord(dtGroupRecord)
	
	set {pubDate, pubKey, pubRef, pubAuthors, pubJournal, pubVolume, pubIssue, pubPage, pubPublisher, pubDOI, pubFilePath} to {pubDate, pubKey, pubRef, pubAuthors, pubJournal, pubVolume, pubIssue, pubPage, pubPublisher, pubDOI, pubFilePath} of recordMetadata
	
	set pubYear to ""
	if pubDate is not missing value then set pubYear to year of pubDate as string
	
	tell application id "DNtp" to set recordTypeDesc to recordType as string
	
	set pubURL to my fullDOIURL(pubDOI)
	
	-- assemble a full x-devonthink-item://... URL from the record's UUID
	set devonthinkURL to my fullDEVONthinkURL(devonthinkUUID)
	
	set pubKeywordString to ""
	if (pubKeywords is not {}) then
		set pubKeywordString to KeypointsLib's mergeTextItems(pubKeywords, ";")
	end if
	
	-- group rating
	set groupRatingString to my ratingStringFromRatingNumber(groupRatingNumber)
	
	-- note label name & color
	set groupLabelName to my labelNameForLabelIndex(groupLabelIndex)
	set colorName to my colorNameForLabelIndex(groupLabelIndex)
	set groupLabelColor to my hexColorForColorName(colorName)
	
	-- assemble the list of Tinderbox attributes for this group
	set groupAttributes to {¬
		{attribKey:"PublicationYear", attribValue:pubYear}, ¬
		{attribKey:"Citekey", attribValue:pubKey}, ¬
		{attribKey:"Citation", attribValue:pubRef}, ¬
		{attribKey:"Authors", attribValue:KeypointsLib's mergeTextItems(pubAuthors, ";")}, ¬
		{attribKey:"Journal", attribValue:pubJournal}, ¬
		{attribKey:"Volume", attribValue:pubVolume}, ¬
		{attribKey:"Issue", attribValue:pubIssue}, ¬
		{attribKey:"Pages", attribValue:pubPage}, ¬
		{attribKey:"Publisher", attribValue:pubPublisher}, ¬
		{attribKey:"DOI", attribValue:pubDOI}, ¬
		{attribKey:"ReferenceURL", attribValue:pubURL}, ¬
		{attribKey:"URL", attribValue:devonthinkURL}, ¬
		{attribKey:"UUID", attribValue:devonthinkUUID}, ¬
		{attribKey:"DEVONthinkType", attribValue:recordTypeDesc}, ¬
		{attribKey:"SourceFile", attribValue:pubFilePath}, ¬
		{attribKey:"SourceURL", attribValue:pubSourceURL}, ¬
		{attribKey:"SourceCreated", attribValue:(my dateToTBDateString(groupCreationDate))}, ¬
		{attribKey:"SourceModified", attribValue:(my dateToTBDateString(groupModificationDate))}, ¬
		{attribKey:"LastImported", attribValue:(my dateToTBDateString(lastRunDate))}, ¬
		{attribKey:"DEVONthinkLabel", attribValue:groupLabelName}, ¬
		{attribKey:"Color", attribValue:groupLabelColor}, ¬
		{attribKey:"Flagged", attribValue:groupIsFlagged as string}, ¬
		{attribKey:"Rating", attribValue:groupRatingNumber as string}, ¬
		{attribKey:"RatingString", attribValue:groupRatingString}, ¬
		{attribKey:"Tags", attribValue:pubKeywordString}}
	
	-- assemble group container name
	set containerName to my tinderboxNameForDEVONthinkGroup(dtGroupRecord, recordMetadata)
	
	-- assemble group container text
	-- TODO: ensure non-empty note text in case pubRef is empty (use groupTitle and/or pubKey?)
	set containerTextParts to {}
	if pubRef is not missing value and pubRef is not "" then copy pubRef to end of containerTextParts
	set containerText to KeypointsLib's mergeTextItems(containerTextParts, linefeed & linefeed)
	
	-- recursively create container note(s) for this group's parent group(s) in Tinderbox
	set dtParentGroupRecord to my firstGroupParentForDEVONthinkRecord(dtGroupRecord)
	if dtParentGroupRecord is not missing value then
		set tbGroupContainer to my createTinderboxNoteForDEVONthinkGroup(dtParentGroupRecord, tbGroupContainer)
	end if
	
	-- create a container note for this group in Tinderbox
	set groupContainer to my createTinderboxNoteInContainer(tbGroupContainer, containerName, containerText, tbGroupContainerPrototypeName, groupAttributes, dtUpdateExistingNotes)
	
	return groupContainer
end createTinderboxNoteForDEVONthinkGroup


-- Creates a new Tinderbox note for each of the given DEVONthink records.
on exportDEVONthinkRecordsToTinderbox(mainTinderboxContainer, tbGroupContainerPathsByGroupID, dtRecords)
	if dtRecords is {} then return
	
	set i to 1
	set recordsCount to count of dtRecords
	KeypointsLib's setupProgress("Exporting selected DEVONthink records to Tinderbox…")
	KeypointsLib's setTotalStepsForProgress(recordsCount)
	set createdNotes to {}
	tell application id "DNtp"
		tell front viewer window
			repeat with dtRecord in dtRecords
				
				-- gather info for this record
				-- NOTE: we assume here that the DEVONthink record's URL contains the URL to a location within a source PDF,
				--           as is the case with the output from the "DEVONthink Notes from PDF Annotations" script
				--           example URL: x-devonthink-item://E6D85298-8025-4E8C-9474-652D4EDFD694?page=0&annotation=Highlight&x=156&y=225
				set {pubSourceURL, devonthinkUUID, recordFilePath, recordKeywords, recordCreationDate, recordModificationDate, recordType, recordName, recordText, recordLabelIndex, recordRatingNumber, recordIsFlagged} to {URL, uuid, path, tags, creation date, modification date, type, name, plain text, label, rating, state} of dtRecord
				
				KeypointsLib's updateProgress(i, "Exporting record " & i & " of " & recordsCount & " (\"" & recordName & "\").")
				
				set recordMetadata to my customMetadataForDEVONthinkRecord(dtRecord)
				
				-- assemble Tinderbox record title
				set tinderboxNoteName to my tinderboxNameForDEVONthinkRecord(dtRecord, recordMetadata)
				
				-- assemble Tinderbox text for this record
				-- NOTE: we currently take the (plain) text of the DEVONthink record as is
				-- TODO: should we (optionally) remove Markdown headings from the body text in the Tinderbox note?
				set tinderboxNoteText to recordText
				
				-- record rating
				set recordRatingString to my ratingStringFromRatingNumber(recordRatingNumber)
				
				-- note label name & color
				set recordLabelName to my labelNameForLabelIndex(recordLabelIndex)
				set colorName to my colorNameForLabelIndex(recordLabelIndex)
				set recordLabelColor to my hexColorForColorName(colorName)
				
				-- record keywords/tags
				set tinderboxTags to ""
				if (recordKeywords is not {}) then
					set tinderboxTags to KeypointsLib's mergeTextItems(recordKeywords, ";")
				end if
				
				-- parent record (aka group) ID
				set groupUUID to ""
				set groupIDs to my uniqueGroupIDsFromDEVONthinkRecords({dtRecord})
				if groupIDs is not missing value and groupIDs is not {} then
					set groupUUID to first item of groupIDs
				end if
				
				-- publication metadata
				set {pubDate, pubKey, pubRef, pubAuthors, pubJournal, pubVolume, pubIssue, pubPage, pubPublisher, pubDOI} to {pubDate, pubKey, pubRef, pubAuthors, pubJournal, pubVolume, pubIssue, pubPage, pubPublisher, pubDOI} of recordMetadata
				
				set pubYear to ""
				if pubDate is not missing value then set pubYear to year of pubDate as string
				
				tell application id "DNtp" to set recordTypeDesc to recordType as string
				
				set pubURL to my fullDOIURL(pubDOI)
				
				-- assemble a full x-devonthink-item://... URL from the record's UUID
				set devonthinkURL to my fullDEVONthinkURL(devonthinkUUID)
				
				-- annotation info
				set pubFilePath to pubFilePath of recordMetadata
				set annotationType to annotationType of recordMetadata
				set annotationPage to annotationPage of recordMetadata
				
				-- for the record's group ID, find the corresponding Tinderbox container note
				set groupContainerPath to tbMainContainerName
				if groupUUID is not "" then
					set groupContainerRecord to (KeypointsLib's recordForKey:"dtGroupUUID" andValue:groupUUID inListOfRecords:tbGroupContainerPathsByGroupID)
					if groupContainerRecord is not missing value then
						set groupContainerPath to tbGroupContainerPath of groupContainerRecord
					end if
				end if
				
				-- set note attributes
				set tinderboxNoteAttributes to {¬
					{attribKey:"PublicationYear", attribValue:pubYear}, ¬
					{attribKey:"Citekey", attribValue:pubKey}, ¬
					{attribKey:"Citation", attribValue:pubRef}, ¬
					{attribKey:"Authors", attribValue:KeypointsLib's mergeTextItems(pubAuthors, ";")}, ¬
					{attribKey:"Journal", attribValue:pubJournal}, ¬
					{attribKey:"Volume", attribValue:pubVolume}, ¬
					{attribKey:"Issue", attribValue:pubIssue}, ¬
					{attribKey:"Pages", attribValue:pubPage}, ¬
					{attribKey:"Publisher", attribValue:pubPublisher}, ¬
					{attribKey:"DOI", attribValue:pubDOI}, ¬
					{attribKey:"ReferenceURL", attribValue:pubURL}, ¬
					{attribKey:"URL", attribValue:devonthinkURL}, ¬
					{attribKey:"UUID", attribValue:devonthinkUUID}, ¬
					{attribKey:"DEVONthinkType", attribValue:recordTypeDesc}, ¬
					{attribKey:"SourceFile", attribValue:pubFilePath}, ¬
					{attribKey:"SourceURL", attribValue:pubSourceURL}, ¬
					{attribKey:"SourceCreated", attribValue:(my dateToTBDateString(recordCreationDate))}, ¬
					{attribKey:"SourceModified", attribValue:(my dateToTBDateString(recordModificationDate))}, ¬
					{attribKey:"LastImported", attribValue:(my dateToTBDateString(lastRunDate))}, ¬
					{attribKey:"AnnotationType", attribValue:annotationType}, ¬
					{attribKey:"AnnotationPage", attribValue:annotationPage}, ¬
					{attribKey:"DEVONthinkLabel", attribValue:recordLabelName}, ¬
					{attribKey:"Color", attribValue:recordLabelColor}, ¬
					{attribKey:"Flagged", attribValue:recordIsFlagged as string}, ¬
					{attribKey:"Rating", attribValue:recordRatingNumber as string}, ¬
					{attribKey:"RatingString", attribValue:recordRatingString}, ¬
					{attribKey:"Tags", attribValue:tinderboxTags}}
				
				-- create a corresponding note for this DEVONthink record in Tinderbox
				set aNote to my createTinderboxNoteInContainerPath(groupContainerPath, tinderboxNoteName, tinderboxNoteText, tbNotePrototypeName, tinderboxNoteAttributes)
				if aNote is not missing value then
					copy aNote to end of createdNotes
					set exportedRecordsCount to exportedRecordsCount + 1
				end if
				
				set i to i + 1
			end repeat
		end tell
	end tell
	
	return createdNotes
end exportDEVONthinkRecordsToTinderbox


-- Generates a name for the given DEVONthink group, based on the defined name format, and returns it.
-- @param groupRecord The DEVONthink group for which a Tinderbox note name shall be generated.
-- @param customRecordMetadata The custom metadata of the DEVONthink group if they've been
-- retrieved already via `customMetadataForDEVONthinkRecord()`, or `missing value` (in which case
-- the custom metadata will be retrieved afresh by this method)
on tinderboxNameForDEVONthinkGroup(groupRecord, customRecordMetadata)
	if groupRecord is missing value then return missing value
	
	return my resolvePlaceholderStringWithDEVONthinkRecord(tbGroupContainerNameFormat, groupRecord, customRecordMetadata)
end tinderboxNameForDEVONthinkGroup


-- Generates a name for the given DEVONthink record, based on the defined name format, and returns it.
-- @param aRecord The DEVONthink record for which a Tinderbox note name shall be generated.
-- @param customRecordMetadata The custom metadata of the DEVONthink record if they've been
-- retrieved already via `customMetadataForDEVONthinkRecord()`, or `missing value` (in which case
-- the custom metadata will be retrieved afresh by this method)
on tinderboxNameForDEVONthinkRecord(dtRecord, customRecordMetadata)
	if dtRecord is missing value then return missing value
	
	return my resolvePlaceholderStringWithDEVONthinkRecord(tbNoteNameFormat, dtRecord, customRecordMetadata)
end tinderboxNameForDEVONthinkRecord

-- Replaces any placeholders in the given placeholder string with data from the given DEVONthink record.
on resolvePlaceholderStringWithDEVONthinkRecord(placeholderString, dtRecord, customRecordMetadata)
	if dtRecord is missing value or placeholderString is missing value or placeholderString is "" then return ""
	
	if customRecordMetadata is missing value or customRecordMetadata is {} then
		set customRecordMetadata to my customMetadataForDEVONthinkRecord(dtRecord)
	end if
	
	set resolvedString to placeholderString
	set regexStart to "<([^<>]*?):"
	set regexEnd to ":([^<>]*?)>"
	
	tell application id "DNtp" to set recordName to name of dtRecord
	if recordName is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "NAME" & regexEnd, "$1" & recordName & "$2")
	end if
	
	set pubDate to pubDate of customRecordMetadata
	if pubDate is not missing value then
		set pubYear to year of pubDate as string
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "YEAR" & regexEnd, "$1" & pubYear & "$2")
	end if
	
	set pubKey to pubKey of customRecordMetadata
	if pubKey is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "CITEKEY" & regexEnd, "$1" & pubKey & "$2")
	end if
	
	set pubAuthor to pubAuthor of customRecordMetadata
	if pubAuthor is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "AUTHOR" & regexEnd, "$1" & pubAuthor & "$2")
	end if
	
	set pubJournal to pubJournal of customRecordMetadata
	if pubJournal is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "JOURNAL" & regexEnd, "$1" & pubJournal & "$2")
	end if
	
	set pubVolume to pubVolume of customRecordMetadata
	if pubVolume is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "VOLUME" & regexEnd, "$1" & pubVolume & "$2")
	end if
	
	set pubIssue to pubIssue of customRecordMetadata
	if pubIssue is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "ISSUE" & regexEnd, "$1" & pubIssue & "$2")
	end if
	
	set pubPage to pubPage of customRecordMetadata
	if pubPage is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "PAGE" & regexEnd, "$1" & pubPage & "$2")
	end if
	
	set pubDOI to pubDOI of customRecordMetadata
	if pubDOI is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "DOI" & regexEnd, "$1" & pubDOI & "$2")
	end if
	
	set pubPMID to pubPMID of customRecordMetadata
	if pubPMID is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "PMID" & regexEnd, "$1" & pubPMID & "$2")
	end if
	
	set pubPMCID to pubPMCID of customRecordMetadata
	if pubPMCID is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "PMCID" & regexEnd, "$1" & pubPMCID & "$2")
	end if
	
	set annotationType to annotationType of customRecordMetadata
	if annotationType is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "ANNOTATIONTYPE" & regexEnd, "$1" & annotationType & "$2")
	end if
	
	set annotationPage to annotationPage of customRecordMetadata
	if annotationPage is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "ANNOTATIONPAGE" & regexEnd, "$1" & annotationPage & "$2")
	end if
	
	set annotationOrder to annotationOrder of customRecordMetadata
	if annotationOrder is not "" then
		set resolvedString to KeypointsLib's regexReplace(resolvedString, regexStart & "ANNOTATIONORDER" & regexEnd, "$1" & annotationOrder & "$2")
	end if
	
	-- remove any unresolved placeholders
	set resolvedString to KeypointsLib's regexReplace(resolvedString, "(" & regexStart & "\\w+" & regexEnd & ")+", "")
	
	-- replace any forward slash(es) in container names as Tinderbox uses these as path separators
	set resolvedString to KeypointsLib's regexReplace(resolvedString, "\\/", replacementStringForForwardSlashInDTNames)
	
	return resolvedString
end resolvePlaceholderStringWithDEVONthinkRecord


-- Returns the path of the Tinderbox note that represents the given DEVONthink record.
on tinderboxPathForDEVONthinkRecord(dtRecord)
	if dtRecord is missing value then return missing value
	
	set pathElements to {tbMainContainerName}
	
	tell application id "DNtp"
		-- replace any forward slash(es) in database names as Tinderbox uses these as path separators
		set dbName to KeypointsLib's regexReplace(name of database of dtRecord, "\\/", replacementStringForForwardSlashInDTNames)
		copy dbName to end of pathElements
		
		set locationPath to location of dtRecord
		
		-- in case of location paths, DEVONthink escapes forward slashes in names as "\/", we'll have to convert these as well
		set locationPath to KeypointsLib's regexReplace(locationPath, "\\\\/", replacementStringForForwardSlashInDTNames)
	end tell
	
	set locationPathElements to KeypointsLib's removeEmptyStringsFromList:(KeypointsLib's splitText(locationPath, "/"))
	
	set groupRecord to my firstGroupParentForDEVONthinkRecord(dtRecord)
	if locationPathElements is not {} and groupRecord is not missing value then
		set last item of locationPathElements to my tinderboxNameForDEVONthinkGroup(groupRecord, missing value)
	end if
	
	set pathElements to KeypointsLib's addItemsFromList:locationPathElements toList:pathElements
	
	set noteName to tinderboxNameForDEVONthinkRecord(dtRecord, missing value)
	copy noteName to end of pathElements
	
	return "/" & KeypointsLib's mergeTextItems(pathElements, "/")
end tinderboxPathForDEVONthinkRecord


-- Iterates over the given DEVONthink records and creates Tinderbox links for any DEVONthink WikiLinks
-- that point to other DEVONthink records that also have a representative note in the same Tinderbox document.
on createTinderboxLinksForDEVONthinkRecords(dtRecords)
	if dtRecords is {} then return
	
	set citedRecords to {}
	set createdLinks to {}
	set LinkTypeNames to my tinderboxLinkTypeNames()
	
	repeat with dtRecord in dtRecords
		set tinderboxSourceNotePath to my tinderboxPathForDEVONthinkRecord(dtRecord)
		set tinderboxSourceNote to tinderboxNoteWithPath(tinderboxSourceNotePath)
		
		tell application id "DNtp"
			tell front viewer window
				set citedRecords to outgoing Wiki references of dtRecord
			end tell
		end tell
		
		if tinderboxSourceNote is not missing value and citedRecords is not {} then
			repeat with citedRecord in citedRecords
				set tinderboxDestinationNotePath to my tinderboxPathForDEVONthinkRecord(citedRecord)
				set tinderboxDestinationNote to tinderboxNoteWithPath(tinderboxDestinationNotePath)
				
				if tinderboxDestinationNote is not missing value then
					-- TODO: find the link in the text of the DEVONthink note record and check if a link type has been assigned, if so, create & set this in TB
					set linkTypeName to "*untitled"
					if linkTypeName is not in LinkTypeNames then
						-- TODO: create new link type
					end if
					
					tell application id "Cere"
						tell front document
							tell tinderboxSourceNote
								-- NOTE: `make new link` generates an error since the `link` element appears to be read-only
								--set aLink to make new link with properties {source:tinderboxSourceNote, destination:tinderboxDestinationNote, type:linkTypeName}
								
								-- alternate approach by Rob Trew (see https://forum.eastgate.com/t/how-to-create-a-link-between-two-notes/2774/4):
								set tinderboxDestinationNoteID to value of (attribute "ID" of tinderboxDestinationNote)
								set aLink to evaluate tinderboxSourceNote with "linkTo(" & tinderboxDestinationNoteID & "," & linkTypeName & ")"
								
								copy aLink to end of createdLinks
							end tell
						end tell
					end tell
				end if
			end repeat
		end if
	end repeat
	
	return createdLinks
end createTinderboxLinksForDEVONthinkRecords


-- Returns an AppleScript record of custom metadata for the given DEVONthink record.
-- The returned AppleScript record will always contain all keys but its values may be empty.
on customMetadataForDEVONthinkRecord(devonthinkRecord)
	if devonthinkRecord is missing value then return {}
	
	tell application id "DNtp" to set customMetadata to custom meta data of devonthinkRecord
	try
		-- customMetadata may be undefined in which case this triggers the error case
		if customMetadata is missing value then set customMetadata to {}
	on error
		set customMetadata to {}
	end try
	
	set recordMetadata to {pubDate:missing value, pubRef:"", pubKey:"", pubAuthor:"", pubAuthors:{}, pubJournal:"", pubVolume:"", pubIssue:"", pubPage:"", pubPublisher:"", pubDOI:"", pubPMID:"", pubPMCID:"", pubFilePath:"", annotationType:"", annotationPage:"", annotationOrder:""}
	
	if customMetadata is {} then return recordMetadata
	
	set pubDate to KeypointsLib's valueForKey:"mddate" inRecord:customMetadata
	if pubDate is not missing value then set recordMetadata to KeypointsLib's setValue:pubDate forKey:"pubDate" inRecord:recordMetadata
	
	set pubRef to KeypointsLib's valueForKey:"mdreference" inRecord:customMetadata
	if pubRef is not missing value and pubRef is not "" then set recordMetadata to KeypointsLib's setValue:pubRef forKey:"pubRef" inRecord:recordMetadata
	
	set pubKey to KeypointsLib's valueForKey:"mdcitekey" inRecord:customMetadata
	if pubKey is not missing value and pubKey is not "" then set recordMetadata to KeypointsLib's setValue:pubKey forKey:"pubKey" inRecord:recordMetadata
	
	set pubAuthor to KeypointsLib's valueForKey:"mdauthor" inRecord:customMetadata
	if pubAuthor is not missing value and pubAuthor is not "" then set recordMetadata to KeypointsLib's setValue:pubAuthor forKey:"pubAuthor" inRecord:recordMetadata
	
	set pubAuthors to KeypointsLib's valueForKey:"mdauthors" inRecord:customMetadata
	if pubAuthors is not missing value and pubAuthors is not "" then set recordMetadata to KeypointsLib's setValue:(KeypointsLib's splitText(pubAuthors, linefeed)) forKey:"pubAuthors" inRecord:recordMetadata
	
	set pubJournal to KeypointsLib's valueForKey:"mdjournal" inRecord:customMetadata
	if pubJournal is not missing value and pubJournal is not "" then set recordMetadata to KeypointsLib's setValue:pubJournal forKey:"pubJournal" inRecord:recordMetadata
	
	set pubVolume to KeypointsLib's valueForKey:"mdvolume" inRecord:customMetadata
	if pubVolume is not missing value and pubVolume is not "" then
		set recordMetadata to KeypointsLib's setValue:pubVolume forKey:"pubVolume" inRecord:recordMetadata
		
		-- if mdvolume also contains an issue (as in "41(4)") then split this into volume & issue
		set pubVolAndIssue to KeypointsLib's regexMatch(pubVolume, "\\d+\\s*\\(\\d+\\)")
		if pubVolAndIssue is not "" then
			set pubVolAndIssueList to KeypointsLib's removeEmptyStringsFromList:(KeypointsLib's regexSplit(pubVolAndIssue, "\\D+"))
			if pubVolAndIssueList is not {} then
				set recordMetadata to KeypointsLib's setValue:(item 1 of pubVolAndIssueList) forKey:"pubVolume" inRecord:recordMetadata
				if (count of pubVolAndIssueList) > 1 then
					set recordMetadata to KeypointsLib's setValue:(item 2 of pubVolAndIssueList) forKey:"pubIssue" inRecord:recordMetadata
				end if
			end if
		end if
	end if
	
	set pubPage to KeypointsLib's valueForKey:"mdpage" inRecord:customMetadata
	if pubPage is not missing value and pubPage is not "" then set recordMetadata to KeypointsLib's setValue:pubPage forKey:"pubPage" inRecord:recordMetadata
	
	set pubPublisher to KeypointsLib's valueForKey:"mdpublisher" inRecord:customMetadata
	if pubPublisher is not missing value and pubPublisher is not "" then set recordMetadata to KeypointsLib's setValue:pubPublisher forKey:"pubPublisher" inRecord:recordMetadata
	
	set pubDOI to KeypointsLib's valueForKey:"mddoi" inRecord:customMetadata
	if pubDOI is not missing value and pubDOI is not "" then set recordMetadata to KeypointsLib's setValue:pubDOI forKey:"pubDOI" inRecord:recordMetadata
	
	set pubPMID to KeypointsLib's valueForKey:"mdpmid" inRecord:customMetadata
	if pubPMID is not missing value and pubPMID is not "" then set recordMetadata to KeypointsLib's setValue:pubPMID forKey:"pubPMID" inRecord:recordMetadata
	
	set pubPMCID to KeypointsLib's valueForKey:"mdpmcid" inRecord:customMetadata
	if pubPMCID is not missing value and pubPMCID is not "" then set recordMetadata to KeypointsLib's setValue:pubPMCID forKey:"pubPMCID" inRecord:recordMetadata
	
	set pubFilePath to KeypointsLib's valueForKey:"mdsourcefile" inRecord:customMetadata
	if pubFilePath is not missing value and pubFilePath is not "" then set recordMetadata to KeypointsLib's setValue:pubFilePath forKey:"pubFilePath" inRecord:recordMetadata
	
	set annotationType to KeypointsLib's valueForKey:"mdannotationtype" inRecord:customMetadata
	if annotationType is not missing value and annotationType is not "" then set recordMetadata to KeypointsLib's setValue:annotationType forKey:"annotationType" inRecord:recordMetadata
	
	set annotationPage to KeypointsLib's valueForKey:"mdsourcepage" inRecord:customMetadata
	if annotationPage is not missing value and annotationPage is not "" then set recordMetadata to KeypointsLib's setValue:annotationPage forKey:"annotationPage" inRecord:recordMetadata
	
	set annotationOrder to KeypointsLib's valueForKey:"mdannotationorder" inRecord:customMetadata
	if annotationOrder is not missing value and annotationOrder is not "" then set recordMetadata to KeypointsLib's setValue:annotationOrder forKey:"annotationOrder" inRecord:recordMetadata
	
	return recordMetadata
end customMetadataForDEVONthinkRecord


-- Returns the DEVONthink record with the specified UUID or x-devonthink-item://... link,
-- or `missing value` if no record could be found.
on devonthinkRecordWithUUID(dtUUID)
	if dtUUID is missing value or dtUUID is "" then return missing value
	
	tell application id "DNtp" to set dtRecord to get record with uuid dtUUID
	return dtRecord
end devonthinkRecordWithUUID


-- Returns the Tinderbox note in the front document that has the given path.
on tinderboxNoteWithPath(notePath)
	if notePath is missing value then return missing value
	
	tell application id "Cere"
		tell front document
			set topLevelContainer to it -- the front document itself
			return find note in topLevelContainer with path notePath
		end tell
	end tell
end tinderboxNoteWithPath


-- Returns the names of all link types defined in the frontmost Tinderbox document as a list.
on tinderboxLinkTypeNames()
	tell application id "Cere"
		set LinkTypeNames to {}
		set documentLinkTypes to (linkTypes of front document)
		
		repeat with aLinkType in documentLinkTypes
			copy name of aLinkType to end of LinkTypeNames
		end repeat
		
		return LinkTypeNames
	end tell
end tinderboxLinkTypeNames


-- Returns a fully formed URL for the given DOI
on fullDOIURL(aDOI)
	set doiURL to ""
	if aDOI is not missing value and aDOI is not "" then
		set doiURL to "https://doi.org/" & aDOI
	end if
	
	return doiURL
end fullDOIURL


-- Returns a fully formed DEVONthink record URL for the given UUID
on fullDEVONthinkURL(devonthinkUUID)
	set devonthinkURL to ""
	if devonthinkUUID is not missing value and devonthinkUUID is not "" then
		set devonthinkURL to "x-devonthink-item://" & devonthinkUUID
	end if
	
	return devonthinkURL
end fullDEVONthinkURL


-- Returns a string of stars that represents the given star rating number.
-- For example, this method would return "★★★" for a rating number of 3.
-- The given rating number must be between 1 and 5, lower numbers will
-- return an empty string, and higher numbers will return "★★★★★".
on ratingStringFromRatingNumber(ratingNumber)
	if ratingNumber is 0 or ratingNumber < 0 then return ""
	if ratingNumber > 5 then set ratingNumber to 5
	
	set ratingStars to "★★★★★"
	set ratingString to (characters 1 thru ratingNumber of ratingStars) as string
	
	return ratingString
end ratingStringFromRatingNumber


-- Maps the given DEVONthink label index (0-7) to a color name and returns it.
on colorNameForLabelIndex(labelIndex)
	if labelIndex is missing value or labelIndex < 0 or labelIndex > 7 then return ""
	
	set colorName to ""
	set labelMapping to (KeypointsLib's recordForKey:"labelIndex" andValue:labelIndex inListOfRecords:labelMappings)
	if labelMapping is not missing value then
		set colorName to labelMapping's colorName
	end if
	
	return colorName
end colorNameForLabelIndex


-- Maps the given DEVONthink label index (0-7) to a label name and returns it.
on labelNameForLabelIndex(labelIndex)
	if labelIndex is missing value or labelIndex < 0 or labelIndex > 7 then return ""
	
	set labelName to ""
	set labelMapping to (KeypointsLib's recordForKey:"labelIndex" andValue:labelIndex inListOfRecords:labelMappings)
	if labelMapping is not missing value then
		set labelName to labelMapping's labelName
	end if
	
	return labelName
end labelNameForLabelIndex


-- Maps the given color name (one of: red, orange, yellow, green, cyan, light blue,
-- dark blue, purple, or pink) to an actual hex color and returns it.
on hexColorForColorName(colorName)
	if colorName is missing value or colorName is "" then return ""
	
	set hexColor to ""
	set colorMapping to (KeypointsLib's recordForKey:"colorName" andValue:colorName inListOfRecords:dtColors)
	if colorMapping is not missing value then
		set hexColor to colorMapping's hexColor
	end if
	
	return hexColor
end hexColorForColorName


-- Convert given AppleScript date to a string in a format recognized by Tinderbox
-- e.g. "13.07.24, 20:00"
on dateToTBDateString(aDate)
	tell aDate to return short date string & ", " & time string
end dateToTBDateString
