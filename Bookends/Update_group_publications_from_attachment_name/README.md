# Update group publications from attachment name

This sample script for Bookends 13.2 or greater shows how to extract information from attachment file names, and set publication metadata accordingly:

For all publications contained in the group chosen from your frontmost Bookends library window, this script will take the first attachment of each publication, extract the part of the attachment name that's enclosed with parentheses, and add all of its words as individual publication keywords.

As an example, consider a PDF file name for an academic paper (e.g.: http://dx.doi.org/10.1038/npp.2015.181) where the user has added his own keywords within parentheses to the file name, like this:

    Chen & Baram '16 (dev stress cognitive review).pdf

This script will extract those keywords ("dev", "stress", "cognitive", and "review") and set the publication's "Keywords" field accordingly.

For more info on how to adopt this script to your needs, please see the comments above the script's source code.


## Installation

The precompiled & signed `.app` version of this script is ready to go. Just [download](https://github.com/extracts/mac-scripting/raw/master/Bookends/Update_group_publications_from_attachment_name/Update_group_publications_from_attachment_name.app.zip) the zipped `.app` package, then double click it to unzip.


## Usage

Before executing the app, make sure that Bookends is running. Then double click the script. This will present a dialog with a list of all user-created groups from your frontmost Bookends library window. Please select the group that contains the publications you'd like to process, then press the "Run" button.

Note that the keywords which were extracted from attachment names will be _appended_ the the "Keywords" field of the corresponding publications. If you'd rather like the current contents of a publication's "Keywords" field get _replaced_ instead, open the script in "Script Editor" app and set its `replaceExistingKeywords` property to `true`. Then compile, save and run the script again.


## Requirements

This script requires macOS 10.10 (Yosemite) or greater, and [Bookends](http://www.sonnysoftware.com/) 13.2 or greater.


## Credits

by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.0

Initial release.
