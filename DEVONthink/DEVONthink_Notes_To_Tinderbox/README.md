# DEVONthink Notes to Tinderbox

Exports all records selected in your frontmost DEVONthink database window as individual notes to Tinderbox.

For each created note, the script transfers a rich set of metadata, like the record's tags, flag, rating, color & label as well as annotation info and any bibliographic metadata. In addition, the script will add deep links to point back to the corresponding record in DEVONthink (and, for annotation notes, to the accompanying PDF annotation & file). Conversion of Wiki links to Tinderbox links is also supported.

![Screenshot of Tinderbox notes created by the 'DEVONthink Notes to Tinderbox' script](https://github.com/extracts/mac-scripting/tree/master/DEVONthink/DEVONthink_Notes_To_Tinderbox/Screenshots/20260112-DEVONthink_Notes_To_Tinderbox-02-B.png)

The script was developed to export annotation notes that have been created in DEVONthink via the [DEVONthink Notes from PDF Annotations](https://github.com/extracts/mac-scripting/tree/master/DEVONthink/DEVONthink_Notes_from_PDF_Annotations) script. However, the script should also work with any kind of DEVONthink record.

For further details, please see the notes at the top of the script.


## Installation

The precompiled & signed `.scptd` version of this script already includes the required scripting library and is ready to go. Just [download](https://github.com/extracts/mac-scripting/raw/master/DEVONthink/DEVONthink_Notes_To_Tinderbox/DEVONthink_Notes_To_Tinderbox.scptd.zip) the zipped `.scptd` package, then double click it to unzip.

After unpacking the script, copy it to a suitable place, like the DEVONthink Scripts folder. To open this folder, activate DEVONthink, select the [Scripts menu](https://download.devontechnologies.com/download/devonthink/3.8.2/DEVONthink.help/Contents/Resources/pgs/menus-scripts.html) and choose "Open Scripts Folder". This will open the DEVONthink Scripts folder in the Finder. It is located at `~/Library/Application Scripts/com.devon-technologies.think3/Menu`.

Alternatively, you could also copy the script to the system's Script menu folder. For an illustrated guide which describes how to enable and use the system's script menu, please see [iworkautomation.com: The script menu](https://iworkautomation.com/numbers/script-menu.html).

If you've placed your script into the DEVONthink Scripts folder, you may also append a keyboard shortcut description (like `___Command-Shift-Alt-T`) to the script's name. You should then be able to run your script by pressing the specified keyboard shortcut.


## Setup

Before running the script, do this once: Open the script in Script Editor and adjust the DEVONthink label <-> color mapping via the properties `label1` ... `label7`, then save the script again. If saving generates an error, please try again with [Script Debugger](https://latenightsw.com/sd8/download/) (which is freely available).

You may also want to check out some of the other script properties as these allow to customize the script, e.g. to adjust the note name formats, or to specify one of your existing prototypes for the created notes.


## Usage

Before running the script, make sure that DEVONthink and Tinderbox are running, and that you've selected all records in DEVONthink that you'd like to export to Tinderbox. You can also select group(s) if you want to export all of the contained (non-group) records.

To run the script, select its menu entry from the (DEVONthink or system's) Scripts menu, or press your keyboard shortcut.

After the script has finished, you'll see a dialog with feedback on how many groups have been processed, how many Tinderbox notes have been created/updated, and how many links between these notes have been established.

Note that you can run the script multiple times for the same DEVONthink record(s) without creating duplicate notes in Tinderbox. This may be useful if you want to update, say, the note text, flag, rating or label color for existing notes. You can prevent updating of existing notes via a setting in the script.


## Discussion & Help:

If you have further questions or issues w.r.t. this script, or want to discuss or request any features, you may do so here:

- https://github.com/extracts/mac-scripting/discussions


## Requirements

This script requires macOS 10.14 (High Sierra) or greater, the [KeypointsScriptingLib](https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib) v1.5 or greater,
and [DEVONthink Pro](https://www.devontechnologies.com/apps/devonthink) v3.8.3 or greater, and [Tinderbox](https://eastgate.com/Tinderbox/) v9.3.0 or greater.


## Credits

by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

Thanks to:

* Users from the Tinderbox forum whose insights helped with scripting Tinderbox, e.g. how to [find notes](https://forum.eastgate.com/t/exporting-annotation-notes-to-tinderbox-can-notes-with-rich-rtf-text-be-created-via-applescript/7750) or how to [create a link between two notes](https://forum.eastgate.com/t/how-to-create-a-link-between-two-notes/2774) via AppleScript.


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.0

Initial release.
