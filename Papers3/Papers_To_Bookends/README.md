# Papers to Bookends

Exports all publications selected in your Papers 3 library (incl. its primary PDFs) to Bookends.

Besides the common publication metadata (supported by the RIS format), this export script will also transfer the following publication properties (if not disabled within the script):

* rating
* color label
* flagged status
* language
* edition
* citekey
* "papers://…" link

For the color label and flagged status, the script will add special keywords to the corresponding Bookends publication (these keywords can be customized within the script). For journal articles, the script will also transfer the publication's PMID and PMCID (if defined).

### Known Issues

Due to a Papers scripting bug, the PDFs exported via this script won't include any annotations that you've added in Papers. However, the below workaround allows you to also include your annotations when exporting publications from your Papers library to Bookends:

To include annotations from your Papers library inside the exported PDFs, do this once (before you run this script):

1. Make sure that the default Bookends attachments folder exists: This is the `Attachments` folder inside the `Bookends` folder within your `Documents` folder. Alternatively, you can specify a different folder in the `attachmentsFolderPath` property (inside the script).

2. Select all publications in your Papers library that you want to export, then choose the "File > Export… > PDF Files and Media" menu command, and make sure that the "Include annotations" checkbox is checked (in the save dialog, you may have to click the "Options" button to see this option).

3. In the save dialog, choose the attachments folder from step 1, and click the "Export" button.

This will export all primary PDFs of all selected publications into your attachments folder. When you then run this script, the PDFs in your attachments folder will be used for import into Bookends.


## Installation

The precompiled & signed `.app` version of this script already includes the required scripting library and is ready to go. Just [download](https://github.com/extracts/mac-scripting/raw/master/Papers3/Papers_To_Bookends/Papers_To_Bookends.app.zip) the zipped `.app` package, then double click it to unzip.


## Usage

Before executing the app, make sure that your Papers and Bookends apps are running, and that you've selected all publications in your Papers library that you'd like to export to Bookends. Then double click the script app to start the export process.

Upon completion, Bookends will display a modal dialog reporting how many publications (and PDFs) were imported. If the reported number of imported publications is less than the number of publications selected in your Papers library, you may want to open Console.app and checkout your system's console log for any errors reported by the script.


## Requirements

This script requires macOS 10.10 (Yosemite) or greater, the [KeypointsScriptingLib](https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib) v1.0 or greater, [Papers](http://papersapp.com/mac) 3.4.2 or greater, and [Bookends](http://www.sonnysoftware.com/) 12.5.5 or greater.


## Credits

by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.1

* For the RIS type `BOOK`, the script now converts the `BT` tag in the RIS record to `TI` so that Bookends 12.8.3 and earlier correctly recognizes the book's title.
* Import errors are now logged to the system's console log.
* The script now also transfers the publication's edition (if defined).

### v1.0

Initial release.
