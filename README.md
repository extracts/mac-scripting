# mac-scripting - Automation scripts for macOS

This repository contains an assortment of MIT-licensed AppleScript or JXA (JavaScript for Automation) scripts for various macOS applications.


## Getting Started with Scripting

### AppleScript

The getting started guide [Scripting Papers 3 for Mac with AppleScript](https://extracts.github.io/mac-scripting/Papers3/Getting_Started) contains a quick intro to AppleScript, and gives concrete examples for scripting Papers 3. The guide's [Resources](https://extracts.github.io/mac-scripting/Papers3/Getting_Started#resources) section contains useful links to further info & tuturials about AppleScript.

### JavaScript for Automation

During NSConference 2015, I've given a short introductory talk about [JavaScript For Automation: A Quick Intro To Its Use For Debugging](https://vimeo.com/124349703). Papers 3 was also used for the code examples in this talk.


## List of scripts

See below for a summary of the scripts contained in this repository, and how to use them. For further info about a certain script, please see the script's README file in the script's subdirectory.

### Papers 3

#### Papers to Bookends

Exports all publications selected in your Papers 3 library to Bookends. The script will also transfer the publication's primary PDF (if there's any) and can also transfer the publication's rating, color label, flagged status, language, edition, citekey, and "papers://..." link. [[More Info](https://github.com/extracts/mac-scripting/tree/master/Papers3/Papers_To_Bookends)] [[Download](https://github.com/extracts/mac-scripting/raw/master/Papers3/Papers_To_Bookends/Papers_To_Bookends.app.zip)]

#### Papers to DEVONthink

Exports all notes & highlight annotations of all publications selected in your Papers 3 library to DEVONthink Pro. The script will also index the publication's primary PDF in DEVONthink Pro, and can also transfer the annotation's color & creation date as well as the publication's formatted reference, citekey, keywords, color label, flagged status, "papers://..." link and BibTeX metadata. [[More Info](https://github.com/extracts/mac-scripting/tree/master/Papers3/Papers_To_DEVONthink)] [[Download](https://github.com/extracts/mac-scripting/raw/master/Papers3/Papers_To_DEVONthink/Papers_To_DEVONthink.app.zip)]


## FAQ

### How to execute AppleScript scripts?

To open an AppleScript script (`.applescript`, `.scpt` or `.scptd`), drag it onto the app icon of the "Script Editor" app (which is located inside the `Utilities` folder within your `Applications` folder). Then click the "Run" button in Script Editor.

Note that you can also save the script as a self-contained application (which you can double-click to execute it), or run it from the system's script menu (see below).

### How to use an AppleScript script with the system's script menu?

The system's script menu provides a convenient way to execute your scripts. This script menu can be enabled in the Script Editor prefs. For an illustrated guide which describes how to enable and use the system's script menu, please see [iworkautomation.com: The script menu](https://iworkautomation.com/numbers/script-menu.html).

### What if a script's README states that the script requires a scripting library?

If you download a precompiled `.app` or `.scptd` version of the script, then you won't need to do anything. In that case, any required scripting libraries are already included inside this signed script package.

If you want to edit and/or compile a script from its text (`.applescript`) version, you'll need to download & install any required scripting libraries separately. Scripting libraries used by scripts in this repository are stored in the `ScriptingLibraries` subdirectory.

Perform the following steps to make a scripting library available to any scripts executed from within your current user account:

1. Find the correct scripting library in the `ScriptingLibraries` subdirectory of this repository.
2. Download the scripting library's `.scptd` or `.zip` file to your desktop (or anywhere else). In case of a `.zip` file, double click it to unzip it.
3. In the Finder, choose "Go to Folder" from the "Go" menu and paste `~/Library/` into it, then hit Return. This opens the (hidden) `Library` folder inside your home folder.
4. Inside this `Library` folder, search for a folder named `Script Libraries`. If it doesn't exist, please create it with this exact name: `Script Libraries`
5. Now copy the `.scptd` file (which you got in step 2) into that `Script Libraries` folder.

For more info about scripting libraries see [macosxautomation.com: AppleScript Libraries](https://macosxautomation.com/mavericks/libraries/index.html) and [Mac Automation Scripting Guide: Using Script Libraries](https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/UseScriptLibraries.html#//apple_ref/doc/uid/TP40016239-CH36-SW1).
