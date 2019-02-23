-- Sample scripts from the getting started guide
-- "Scripting Bookends 13 with AppleScript"

-- uncomment/comment the lines/blocks that you want to try out/ignore...
-- block comments start with "(*" and end with "*)"
-- single-line comments start with "--"


-- APPLESCRIPT LANGUAGE ESSENTIALS

-- -- Getting data

(*
tell application "Bookends"
	get library windows
end tell
*)

--tell application "Bookends" to get library windows

-- -------------------------------------------------------

-- -- Lists

(*
set myList to {1, 3, "Sonny Software", 5.5}

get item 2 of myList
get 2nd item of myList
get second item of myList

get last item of myList
get items 2 thru 3 of myList
*)

(*
tell application "Bookends"
	get properties of front library window
end tell
*)

-- -------------------------------------------------------

-- -- Properties

(*
tell application "Bookends"
	get name of front library window
end tell
*)

(*
tell application "Bookends"
	get group recently viewed of front library window
end tell
*)

(*
tell application "Bookends"
	get publication items of group recently viewed of front library window
end tell
*)

(*
tell application "Bookends"
	tell front library window
		get publication items of group recently viewed
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		get properties of first item of publication items of group recently viewed
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Elements

(*
tell application "Bookends"
	tell front library window
		get attachment items of last item of publication items
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		get attachment items of last publication item
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Filtering

(*
tell application "Bookends"
	tell front library window
		get every publication item whose title contains "review"
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		get every publication item whose title contains "review" and authors contains "Thomas, D"
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set pubList to every publication item
		set myList to {}
		repeat with i from 1 to count of pubList
			set aPub to item i of pubList
			if title of aPub contains "review" and authors of aPub contains "Thomas, D" then
				copy aPub to end of myList
			end if
		end repeat
		get myList
	end tell
end tell
*)


-- -------------------------------------------------------


-- SCRIPTING BOOKENDS

-- -- Object inheritance

(*
tell application "Bookends"
	tell front library window
		get properties of first attachment item of first publication item
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Container hierarchy

(*
tell application "Bookends"
	tell front library window
		get group items
	end tell
end tell
*)

--tell application "Bookends" to get every group item of front library window

(*
tell application "Bookends"
	tell front library window
		set pubList to publication items of every group item
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set {pubsByGroup, groupNames} to {publication item, name} of every group item
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		get attachment items of publication items of every group item
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Creating new objects

(*
tell application "Bookends"
	tell front library window
		make new publication item with properties {title:"My great new paper", publication date string:"2019/01/31"}
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		make new publication item with properties {authors:"Mock, T" & linefeed & "Thomas, DN", citekey:"Mock+Thomas2005", doi:"10.1111/j.1462-2920.2005.00781.x", pmid:"15819843", title:"Recent advances in sea-ice microbiology", publication date string:"2005/03/21", journal:"Environ Microbiol", volume:"7(5)", pages:"605-619"}
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		make new group item with properties {name:"New Group"}
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Updating object properties

(*
tell application "Bookends"
	tell front library window
		set aPub to last publication item
		set title of aPub to "My great new paper"
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set rating of (every publication item whose keywords contains "review") to 4
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set pubList to every publication item whose keywords contains "review"
		repeat with aPub in pubList
			set rating of aPub to 4
		end repeat
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Deleting objects

(*
tell application "Bookends"
	delete last publication item of front library window
end tell
*)

(*
tell application "Bookends"
	tell front library window
		delete (every publication item whose title is "My great new paper" and keywords is "")
	end tell
end tell
*)


-- -------------------------------------------------------


-- USE CASES

-- -- Importing publications

(*
tell application "Bookends"
	set pubList to quick add {"10.1084/jem.20052494", "20465544", "arXiv:0706.0001"}
end tell
*)

(*
tell application "Bookends"
	set pubList to quick add {"9781405185806"} to second library window
end tell
*)

-- -------------------------------------------------------

-- -- Working with groups

(*
tell application "Bookends"
	tell front library window
		set allGroup to group all
		set attGroup to group attachments
		set hitsGroup to group hits
		set recentsGroup to group recently viewed
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set pubsWithFiles to publication items of group attachments
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set pubsWithMultipleFiles to publication items of group attachments whose attachments contains "\n"
	end tell
end tell
*)

(*
tell application "Bookends"
	set myGroups to group items of front library window
end tell
*)

(*
tell application "Bookends"
	set myGroups to group items of front library window
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set timeDiff to (current date) - 2 * days -- last 2 days
		set recentlyAddedPubs to publication items where date added > timeDiff
		if recentlyAddedPubs is not {} then
			set groupName to "New Group"
			make new group item with properties {name:groupName}
			add recentlyAddedPubs to group item groupName
		end if
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set groupName to "New Group"
		set lastAddedPub to last publication item
		set idList to id of publication items of group item groupName
		if id of lastAddedPub is in idList then
			remove lastAddedPub from group item groupName
		end if
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Formatting publications

(*
tell application "Bookends"
	tell front library window
		set formattedReference to format last publication item
		set the clipboard to formattedReference
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set pubsList to every publication item whose keywords contains "review"
		if pubsList is not {} then
			set formattedReferences to format pubsList using "Vancouver.fmt"
		end if
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Finding publications

(*
tell application "Bookends"
	tell front library window
		set matchingPubs to sql search "keywords REGEX '(?i)primary producti(on|vity)'"
	end tell
end tell
*)

(*
tell application "Bookends"
	tell front library window
		set matchingPubs to sql search "authors REGEX '\\bNicol\\b,'"
	end tell
end tell
*)

-- -------------------------------------------------------

-- -- Exporting publications

(*
tell application "Bookends"
	tell front library window
		set pubsList to publication items of group hits
		if pubsList is not {} then
			set bibtexRefs to format pubsList using "BibTeX.fmt" as BibTeX
			set the clipboard to bibtexRefs
		end if
	end tell
end tell
*)

(*
tell application "Bookends"
	set groupName to "My Papers" -- adopt to your needs
	set outFile to ((path to desktop from user domain) as string) & "Bibliography.ris"
	tell front library window
		set pubsList to publication items of group item groupName
		if pubsList is not {} then
			set risContent to format pubsList using "RIS.fmt"
			my writeTextToFile(outFile, risContent)
		end if
	end tell
end tell

--- Saves the given text to the specified file. Note that this will replace any existing file content.
on writeTextToFile(aFile, theText)
	set aFileRef to open for access aFile with write permission
	set eof aFileRef to 0
	write theText to aFileRef as «class utf8»
	close access aFileRef
end writeTextToFile
*)
