# Papers to Bookends

Exports all publications selected in your Papers 3 library (incl. its primary PDFs) to Bookends.

Besides the common publication metadata (supported by the RIS format), this export script will
also transfer the following publication properties (if not disabled within the script):

* rating
* color label
* flagged status
* language
* citekey
* "papers://…" link

For journal articles, this script will also transfer the publication's PMID and PMCID (if defined).

### Known Issues

Due to a Papers scripting bug, the PDFs exported via this script won't include any
annotations that you've added in Papers. However, the below workaround allows you to also
include your annotations when exporting publications from your Papers library to Bookends:

To include annotations from your Papers library inside the exported PDFs, do this once (before
you run this script):

1. Make sure that the default Bookends attachments folder exists: This is the "Attachments"
folder inside the "Bookends" folder within your "Documents" folder. Alternatively, you
can specify a different folder in the `attachmentsFolderPath` property (inside the script).

2. Select all publications in your Papers library that you want to export, then choose
the "File > Export… > PDF Files and Media" menu command, and make sure that the
"Include annotations" checkbox is checked (in the save dialog, you may have to click
the "Options" button to see this option).

3. In the save dialog, choose the attachments folder from step 1, and click the "Export"
button.

This will export all primary PDFs of all selected publications into your attachments folder.
When you then run this script, the PDFs in your attachments folder will be used for import
into Bookends.


## Installation

The precompiled & signed `.app` version of this script already includes the required scripting library and is ready to go. Just [[download](https://github.com/extracts/mac-scripting/raw/master/Papers3/Papers_To_Bookends/Papers_To_Bookends.app.zip)] the zipped `.app` package, then double click it to unzip.

Before executing the app, make sure that your Papers and Bookends apps are running, and that you've selected all publications in your Papers library that you'd like to export to Bookends. Then double click the script app to start the export process. Upon completion, Bookends will display a modal dialog reporting how many publications (and PDFs) were imported.


## Requirements

This script requires macOS 10.10 (Yosemite) or greater, the [KeypointsScriptingLib](https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib) v1.0 or
greater, [Papers 3](http://papersapp.com/mac), and [Bookends](http://www.sonnysoftware.com/) 12.5.5 or greater.


## Credits

by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script
as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.0

Initial release.
