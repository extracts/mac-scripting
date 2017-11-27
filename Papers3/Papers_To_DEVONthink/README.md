# Papers to DEVONthink

Exports all notes & highlight annotations of all publications selected in your Papers 3 library to DEVONthink Pro.

If not disabled within the script, the publication's primary PDF will be also indexed in DEVONthink Pro.

This export script will transfer the following annotation properties:

* logical page number
* quoted text
* annotation type
* creation date
* annotation color

In addition, these publication properties are also transferred:

* formatted reference
* cite key
* keywords
* color label
* flagged status
* "papers://…" link
* BibTeX metadata

The export of some of these properties can be disabled within the script. Example note as created by this script:

```
Krell, A. et al., 2003. The biology and chemistry of land fast ice in the White Sea, Russia–A comparison of winter and spring conditions. Polar Biology, 26(11), pp.707–719.

{Krell++2003WhiteSea}

p.707: Sea ice therefore probably plays a major role in structuring the White Sea ecosystem, since it strongly alters the exchange of energy and material between water and atmosphere. -- Highlighted 26.11.2017
```


## Installation

The precompiled & signed `.app` version of this script already includes the required scripting library and is ready to go. Just [download](https://github.com/extracts/mac-scripting/raw/master/Papers3/Papers_To_DEVONthink/Papers_To_DEVONthink.app.zip) the zipped `.app` package, then double click it to unzip.


## Usage

Before executing the app, make sure that your Papers and DEVONthink Pro apps are running, and that you've selected all publications in your Papers library that you'd like to export to DEVONthink Pro. Then double click the script app to start the export process.

For each publication with a PDF, the script will create a group within the database or group you've selected in DEVONthink Pro, and populate it with RTF notes for each of your note or highlight annotations.

Upon completion, DEVONthink Pro will display a modal dialog reporting how many publications (and annotations) were imported.

Note that, if you again select the same database or group in DEVONthink Pro, you can run the script multiple times for the same PDF without creating duplicate notes. This may be useful if you want to add newly added annotations or update the label color for existing ones. However, if a note was modified in DEVONthink Pro, the script will leave it as is and create a duplicate note with the original note contents.


## Requirements

This script requires macOS 10.10 (Yosemite) or greater, the [KeypointsScriptingLib](https://github.com/extracts/mac-scripting/tree/master/ScriptingLibraries/KeypointsScriptingLib) v1.2 or greater, [Papers](http://papersapp.com/mac) 3.4.2 or greater, and [DEVONthink Pro](http://www.devontechnologies.com/products/devonthink/overview.html) 12.9.16 or greater.


## Credits

by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de

Thanks to:

* Rob Trew whose "[Papers2 to Devonthink](http://blog.devontechnologies.com/2011/03/1651/)" and "[Sente 6 Notes to Devonthink](https://github.com/RobTrew/tree-tools/blob/master/DevonThink%20scripts/Sente6ToDevn73.applescript)" scripts gave a lot of inspiration for this script.
* Stephan Zellerhoff for providing code and suggestions on how to improve the script.


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.0

Initial release.
