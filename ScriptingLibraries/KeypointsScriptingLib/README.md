# Keypoints Scripting Library

This script library contains useful AppleScript and AppleScriptObjC methods that can be used when
writing scripts for the Mac.


## Installation & Usage

For installation and usage information, see the FAQ entry "What if a script's README states that the script requires a scripting library?" in the [repository README](https://github.com/extracts/mac-scripting#what-if-a-scripts-readme-states-that-the-script-requires-a-scripting-library) and the linked web resources.


## Requirements

This script library requires macOS 10.9 (Mavericks) or greater. You'll need at least macOS 10.10 (Yosemite) if you want to include some of its AppleScriptObjC handlers directly within your own scripts.


## Credits

by Matthias Steffens, keypointsapp.net, mat(at)extracts(dot)de

Some methods were taken (or modified after) sample methods from the eBook [Everyday AppleScriptObjC](http://www.macosxautomation.com/applescript/apps/everyday_book.html)
by Shane Stanley which is a great introduction to AppleScriptObjC and which shows how to write
AppleScriptObjC-based script libraries.


## License

This script is licensed under the MIT license. In short, you can do whatever you want with this script
as long as you include the original copyright and license notice in any copy of the script/source.

For more info, please see [MIT license](https://github.com/extracts/mac-scripting/blob/master/LICENSE).


## Release Notes

### v1.3

* Improved the `valueForKey:inRecord:` & `fileExistsAtFilePath()` methods, and added more methods, e.g. to support the [DEVONthink Notes from PDF Annotations](https://github.com/extracts/mac-scripting/tree/master/DEVONthink/DEVONthink_Notes_from_PDF_Annotations) script.

### v1.2

* Worked around an AppleScriptObjC bug in macOS 10.13.0 (High Sierra) where `current application's NSNotFound` is returning the wrong value.

### v1.1

* The `-regexMatch`, `-regexReplace`, `-textReplace` and `-splitText` handlers now properly handle faulty (`nil`) input.

### v1.0

Initial release.
