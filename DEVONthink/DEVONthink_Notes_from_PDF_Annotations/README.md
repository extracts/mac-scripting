# DEVONthink Notes from PDF Annotations

For each of the PDFs selected in DEVONthink, this script will iterate over its contained PDF annotations and create or update a Markdown record for each markup or text annotation.

The URL of each Markdown record will be set to a deep link that directly points to the corresponding PDF annotation. I.e., clicking this deep link will open the associated PDF and scroll the corresponding PDF annotation into view.

For each Markdown record, the script assigns a color label that matches your annotation's highlight color (see [Setup](#setup) below).

The script recognizes some markup syntax in PDF annotation notes. This lets you specify the annotation's name/title and comment as well as its flagged status, star rating, tags and custom metadata. Example annotation note as supported by this script:

```
# Your title for this annotation

Your comment about this annotation.

< *** @tag @another tag @:flagged @:metadatakey:Some value
```

If a DOI was found for the PDF, the script can also fetch its bibliographic metadata and set the custom metadata and/or Finder comment of the Markdown records & their group accordingly.

Starting with v1.3, the script can be triggered from a DEVONthink smart rule. This allows to automatically extract PDF annotations from imported or updated PDFs.

For further details, please see the notes at the top of the script.


## Installation

The precompiled & signed `.scptd` version of this script already includes the required scripting library and is ready to go. Just [download](https://github.com/extracts/mac-scripting/raw/master/DEVONthink/DEVONthink_Notes_from_PDF_Annotations/DEVONthink_Notes_from_PDF_Annotations.scptd.zip) the zipped `.scptd` package, then double click it to unzip.

After unpacking the script, copy it to a suitable place, like the DEVONthink Scripts folder. To open this folder, activate DEVONthink, select the [Scripts menu](https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/menus-scripts.html) and choose "Open Scripts Folder". This will open the DEVONthink Scripts folder in the Finder. It is located at `~/Library/Application Scripts/com.devon-technologies.think3/Menu`.

Alternatively, you could also copy the script to the system's Script menu folder. For an illustrated guide which describes how to enable and use the system's script menu, please see [iworkautomation.com: The script menu](https://iworkautomation.com/numbers/script-menu.html).

If you've placed your script into the DEVONthink Scripts folder, you may also append a keyboard shortcut description (like `___Command-Shift-Alt-A`) to the script's name. You should then be able to run your script by pressing the specified keyboard shortcut.

If you want the script to be triggered by a DEVONthink smart rule instead, please move the script into the DEVONthink smart rule scripts folder at `~/Library/Application Scripts/com.devon-technologies.think3/Smart Rules`. Then, in your smart rule, add an "Execute Script" action and choose "External" as well as your script from the dropdown menus. For more info, see the DEVONthink help on [Smart Rules](https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/automation-smartrules.html) and [Smart Rule Scripts](https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/automation-smartrulescripts.html).


## Setup

Before running the script, do this once: Open the script in Script Editor and adjust the DEVONthink label <-> color mapping via the properties `label1` ... `label7`, then save the script again. If saving generates an error, please try again with [Script Debugger](https://latenightsw.com/sd8/download/) (which has a free "lite" mode).

You may also want to check out some of the other script properties as these allow to customize the script, e.g. to enable updating of existing notes or automatic fetching of BibTeX data.


## Usage

Before running the script, make sure that DEVONthink is running, and that you've selected one or more PDF records with PDF annotations in DEVONthink.

To run the script, select its menu entry from the (DEVONthink or system's) Scripts menu, or press your keyboard shortcut.

After the script has finished, you'll see a dialog with feedback on how many PDFs have been processed and how many note records have been created/updated. For each PDF, its annotation notes are stored within a DEVONthink group next to the PDF.

Note that you can run the script multiple times with the same PDF record(s) selected in DEVONthink. On a subsequent run of the script, all notes that were newly created (or updated) will be selected.

If the script was executed automatically from within a DEVONthink smart rule (which, in turn, may have been triggered by an Import or Save event), script feedback will be reported via a notification, and created/updated notes won't get selected.


## Discussion & Help:

If you have further questions or issues w.r.t. this script, or want to discuss or request any features, you may do so in either of these forums:

- https://discourse.devontechnologies.com/t/script-to-create-individual-markdown-notes-from-pdf-annotations/80987
- https://github.com/extracts/mac-scripting/discussions


## Requirements

This script requires macOS 10.14 (High Sierra) or greater, the [KeypointsScriptingLib](https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib) v1.5 or greater,
and [DEVONthink Pro](https://www.devontechnologies.com/apps/devonthink) v3.x or greater (DEVONthink Pro v3.9 or greater will be required to have deep links to PDF annotations work correctly).


## Credits

by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

Thanks to:

* mdbraber whose "[ASObjC script code to parse PDF annotations](https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30)" gave inspiration for this script.
* Rob Trew for his "[Sente 6 Notes to Devonthink](https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript)" script.
* Takaaki Naganoya, Piyomaru Software, for his [makeNSRect](http://piyocast.com/as/archives/643) handler.


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.3

* The script can now be triggered from a DEVONthink smart rule. This allows to automatically extract PDF annotations from imported or updated PDFs.
* If available, the script now extracts a PDF annotation's creation date and sets the creation date of the created Markdown record accordingly.
* When recreating a Markdown record from its PDF annotation, the record's ID-like alias now remains stable.
* Fixed an issue where, upon completion, the script would only select created/updated Markdown records from the PDF that got processed last.

### v1.2

* The script will now recognize & import PDF annotations of type "FreeText". Unlike ordinary text annotations that are displayed in a pop-up window, free text annotations are always visible.
* For each Markdown record, the script will now add a sort identifier string to an `annotationorder` custom metadata field. This metadata field can be used in DEVONthink to sort annotations in the order they appear in the text of a PDF page.
* Added hook method `preprocessAnnotationComment()` which gets called for every annotation with an annotation comment. This can be used to preprocess & transform the given annotation comment (which may contain [custom markup syntax](https://discourse.devontechnologies.com/t/script-to-create-individual-markdown-notes-from-pdf-annotations/80987/10)) into a Keypoints-style format that's supported by this script.

### v1.1

* If a PDF has a DOI set in custom metadata this will be preferred over any DOI extracted from the PDF itself.
* Fixed an issue where only custom attributes from the last metadata line were extracted from a PDF annotation note.
* Fixed an issue where "…" was incorrectly appended when generating note names.

### v1.0

Initial release.
