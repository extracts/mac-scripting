-- Keypoints Scripting Lib
-- version 1.5, licensed under the MIT license

-- by Matthias Steffens, keypoints.app, mat(at)extracts(dot)de

-- An AppleScriptObjC-based script library which contains useful AppleScriptObjC methods
-- that can be used when scripting Keypoints (keypointsapp.net) or other Mac apps.

-- Credits: Some methods were taken (or modified after) sample methods from the
-- eBook "Everyday AppleScriptObjC" which is a great introduction to AppleScriptObjC
-- and which shows how to write AppleScriptObjC-based script libraries.
-- see http://www.macosxautomation.com/applescript/apps/everyday_book.html

use framework "/System/Library/Frameworks/AppKit.framework"
use framework "/System/Library/Frameworks/Quartz.framework"
use scripting additions

-- NOTE: this works around an AppleScriptObjC bug in macOS 10.13.0 (High Sierra) where `current application's NSNotFound` returns the
-- wrong value (-1) instead of something close to 9223372036854775807 (pre 10.13.0, `NSNotFound` returns 9.22337203685478E+18).
-- see http://latenightsw.com/high-sierra-applescriptobjc-bugs/
property NSNotFound : a reference to 9.22337203685477E+18 + 5807

-- STRINGS

-- Searches the given input string using the given search pattern (which is treated as regular expression).
-- Returns the first substring matched by the entire search pattern, or an empty string (in case nothing
-- was matched).
-- @param someText The input string on which the search shall be performed
-- @param searchPattern The search string as an ICU-compatible regular expression
on regexMatch(someText, searchPattern)
	if someText is missing value then return ""
	if searchPattern is missing value then return ""
	
	set theString to current application's NSString's stringWithString:someText
	set theRange to theString's rangeOfString:searchPattern options:(current application's NSRegularExpressionSearch)
	if location of theRange = NSNotFound then
		set foundString to ""
	else
		set foundString to theString's substringWithRange:theRange
	end if
	return foundString as text
end regexMatch

-- Performs a regex search/replace action on the given input string. The given search & replace patterns are treated
-- as regular expressions. Returns the input string in case nothing was matched.
-- @param someText The input string on which the search/replace shall be performed
-- @param searchPattern The search string as an ICU-compatible regular expression
-- @param replacePattern The replace string as an ICU-compatible regular expression
on regexReplace(someText, searchPattern, replacePattern)
	if someText is missing value then return ""
	if searchPattern is missing value or replacePattern is missing value then return someText
	
	set theString to current application's NSString's stringWithString:someText
	set theString to theString's stringByReplacingOccurrencesOfString:searchPattern withString:replacePattern options:(current application's NSRegularExpressionSearch) range:{location:0, |length|:length of someText}
	return theString as text
end regexReplace

-- Splits the given input string on delimiter strings matched by the given regex pattern.
-- @param someText The input string which shall be split into substrings
-- @param searchPattern The search string as an ICU-compatible regular expression used to split the input string
on regexSplit(someText, searchPattern)
	set splitSeparator to "___|^SPLIT-SEPARATOR^|___"
	
	set theString to my regexReplace(someText, searchPattern, splitSeparator)
	
	if theString contains splitSeparator then
		return my splitText(theString, splitSeparator) as list
	else
		return someText
	end if
end regexSplit

-- Performs a literal search/replace action on the given input string. Returns the input string in case nothing was matched.
-- @param someText The input string on which the search/replace shall be performed
-- @param searchText The search string (treated as a case insensitive query)
-- @param replaceText The replace string
on textReplace(someText, searchText, replaceText)
	if someText is missing value then return ""
	if searchText is missing value or replaceText is missing value then return someText
	
	set theString to current application's NSMutableString's stringWithString:someText
	set theString to theString's stringByReplacingOccurrencesOfString:searchText withString:replaceText options:(current application's NSCaseInsensitiveSearch) range:{location:0, |length|:length of someText}
	return theString as text
end textReplace

-- Splits the given input string on the provided delimiter string. Returns the input string as list in case the delimiter string
-- wasn't found in the input string.
-- @param someText The input string which shall be split into substrings
-- @param splitDelim The delimiter string used to split the input string
on splitText(someText, splitDelim)
	if someText is missing value or someText is "" then return "" as list
	if splitDelim is missing value then return someText as list
	
	set theString to current application's NSString's stringWithString:someText
	set theArray to theString's componentsSeparatedByString:splitDelim
	return theArray as list
end splitText

-- Returns up to the given number of words (including any trailing punctuation) from the given string.
-- If the extracted string is shorter than the original string, "…" is appended at the end of the returned string.
on firstWordsFromText(aString, numberOfWords)
	set subString to my regexMatch(aString, "^(\\s*[\\w\\p{P}]+){1," & numberOfWords & "}") as string
	
	if subString is not "" then
		-- append "…" to the extracted string if the given string is longer
		if (count of subString) < (count of aString) then set subString to subString & "…"
	end if
	
	return subString
end firstWordsFromText


-- STRINGS (TRANSFORMATIONS)

-- Converts the given string to uppercase and returns it.
on uppercaseText(theString)
	set theString to current application's NSString's stringWithString:theString
	set theTransformedString to theString's uppercaseString
	return theTransformedString as text
end uppercaseText

-- Converts the given string to lowercase and returns it.
on lowercaseText(theString)
	set theString to current application's NSString's stringWithString:theString
	set theTransformedString to theString's lowercaseString
	return theTransformedString as text
end lowercaseText

-- Converts the given string to a capitalized string and returns it.
on capitalizedText(theString)
	set theString to current application's NSString's stringWithString:theString
	set theTransformedString to theString's capitalizedString
	return theTransformedString as text
end capitalizedText

-- Removes whitespace & newlines from both ends of the given string and returns it.
on trimWhitespace(theString)
	if theString is missing value or theString is "" then return ""
	
	set theString to current application's NSString's stringWithString:theString
	set theTransformedString to theString's stringByTrimmingCharactersInSet:(current application's NSCharacterSet's whitespaceAndNewlineCharacterSet())
	return theTransformedString as text
end trimWhitespace


-- STRINGS (FILE PATHS/NAMES)

-- Interprets the given string as file path or file name and returns its file extension,
-- if there's any. Otherwise an empty string is returned.
on fileExtension(thePath)
	set theString to current application's NSString's stringWithString:thePath
	set theExtension to theString's pathExtension
	return theExtension as text
end fileExtension


-- LISTS / ARRAYS

-- Returns the index of the given item in the given list. Returns 0 if the item is not contained in the list.
on indexOf:anItem inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theIndex to theArray's indexOfObject:anItem
	if theIndex = NSNotFound then
		return 0
	else
		return (theIndex + 1) -- we add 1 since Cocoa uses zero-based indexes
	end if
end indexOf:inList:

-- Adds the items contained in `otherList` to the end of `theList` and returns the latter.
on addItemsFromList:otherList toList:theList
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	set otherArray to current application's NSArray's arrayWithArray:otherList
	theArray's addObjectsFromArray:otherArray
	return theArray as list
end addItemsFromList:toList:

-- Removes the item at the given index from the given list.
-- Note that the given index must be zero-based, i.e. the first item has index 0.
-- by Shane Stanley, see https://forum.latenightsw.com/t/applescriptobjc-method-to-delete-a-list-item-by-index/3408
on removeItemAtIndex:theIndex inList:theList
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	theArray's removeObjectAtIndex:theIndex
	return theArray as list
end removeItemAtIndex:inList:

-- Removes the given item from the given list.
-- by Shane Stanley, see https://forum.latenightsw.com/t/applescriptobjc-method-to-delete-a-list-item-by-index/3408
on removeItem:theItem inList:theList
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	theArray's removeObject:theItem
	return theArray as list
end removeItem:inList:

-- Returns a list containing the results of invoking valueForKey: using the given key on each of the given list’s items.
on valueForKey:theKey inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theResult to theArray's valueForKey:theKey
	return theResult as list
end valueForKey:inList:

-- Returns a list containing the results of invoking valueForKeyPath: using the given key path on each of the given list’s items.
on valueForKeyPath:theKeyPath inList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theResult to theArray's valueForKeyPath:theKeyPath
	return theResult as list
end valueForKeyPath:inList:

-- Sorts the given list of items.
on sortList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theArray to theArray's sortedArrayUsingSelector:"compare:"
	return theArray as list
end sortList:

-- Sorts the given list of items by the given key, in ascending (true) or descending (false) order.
-- 'selectorName' must be one of these: "compare:", or alternatively in case of string values being compared: "caseInsensitiveCompare:", "localizedCaseInsensitiveCompare:", "localizedCompare:", "localizedStandardCompare:"
on sortList:theList byKey:theKey inAscendingOrder:sortAscending usingSelector:selectorName
	set theArray to current application's NSArray's arrayWithArray:theList
	set theSortDescriptor to current application's NSSortDescriptor's sortDescriptorWithKey:theKey ascending:sortAscending selector:selectorName
	set theDescriptors to current application's NSArray's arrayWithObject:theSortDescriptor
	set theArray to theArray's sortedArrayUsingDescriptors:theDescriptors
	return theArray as list
end sortList:byKey:inAscendingOrder:usingSelector:

-- Sorts the given list of strings the same way as the Finder does, taking into account numerals in names.
on sortStringList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theArray to theArray's sortedArrayUsingSelector:"localizedStandardCompare:"
	return theArray as list
end sortStringList:

-- For the given list, this returns a record with collection statistics (sum, max, min, avg) and unique values.
on analyzeList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set theCount to (theArray's valueForKeyPath:"@count.self") as real
	set theSum to (theArray's valueForKeyPath:"@sum.self") as real
	set theMax to (theArray's valueForKeyPath:"@max.self") as real
	set theMin to (theArray's valueForKeyPath:"@min.self") as real
	set theAvg to (theArray's valueForKeyPath:"@avg.self") as real
	set uniqueValues to (theArray's valueForKeyPath:"@distinctUnionOfObjects.self") as list
	return {theCount:theCount, theSum:theSum, theMax:theMax, theMin:theMin, theAvg:theAvg, uniqueValues:uniqueValues}
end analyzeList:

-- Removes all empty string items from the given list.
on removeEmptyStringsFromList:theList
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	theArray's removeObject:""
	return theArray as list
end removeEmptyStringsFromList:

-- For the given list of strings, returns a list with all values beginning with the given prefix.
-- @param negateResults Set to `true` if all values NOT beginning with the given prefix shall be returned,
--    otherwise use `false`
on itemsFromList:theList withPrefix:thePrefix negateResults:negateResults
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	if negateResults is true then
		set thePred to current application's NSPredicate's predicateWithFormat:("NOT (SELF beginswith[c] %@)") argumentArray:{thePrefix}
	else
		set thePred to current application's NSPredicate's predicateWithFormat:("SELF beginswith[c] %@") argumentArray:{thePrefix}
	end if
	set theResult to (theArray's filteredArrayUsingPredicate:thePred)
	return theResult as list
end itemsFromList:withPrefix:negateResults:

-- For the given list of strings, returns a list with all values containing the given substring.
-- @param negateResults Set to `true` if all values NOT containing the given substring shall be returned,
--    otherwise use `false`
on itemsFromList:theList containingSubstring:theString negateResults:negateResults
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	if negateResults is true then
		set thePred to current application's NSPredicate's predicateWithFormat:("NOT (SELF contains[c] %@)") argumentArray:{theString}
	else
		set thePred to current application's NSPredicate's predicateWithFormat:("SELF contains[c] %@") argumentArray:{theString}
	end if
	set theResult to (theArray's filteredArrayUsingPredicate:thePred)
	return theResult as list
end itemsFromList:containingSubstring:negateResults:

-- For the given list of strings, returns a list with all values matching the given regex pattern.
-- Note that this only returns list items where the regex pattern fully matches its entire value.
-- @param negateResults Set to `true` if all values NOT containing the given substring shall be returned,
--    otherwise use `false`
-- @see https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pUsing.html#//apple_ref/doc/uid/TP40001794-SW9
on itemsFromList:theList matchingRegex:theRegex negateResults:negateResults
	set theArray to current application's NSMutableArray's arrayWithArray:theList
	if negateResults is true then
		set thePred to current application's NSPredicate's predicateWithFormat:("NOT (SELF matches %@)") argumentArray:{theRegex}
	else
		set thePred to current application's NSPredicate's predicateWithFormat:("SELF matches %@") argumentArray:{theRegex}
	end if
	set theResult to (theArray's filteredArrayUsingPredicate:thePred)
	return theResult as list
end itemsFromList:matchingRegex:negateResults:

-- Combines all items of the sublists in the given list into a single list.
-- @see For a pure AppleScript method to flatten a nested list, see `flattenList()` below.
on unionOfListsInList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set unionOfArrays to (theArray's valueForKeyPath:"@unionOfArrays.self")
	return unionOfArrays as list
end unionOfListsInList:

-- Combines all unique items of the sublists in the given list into a single list.
on distinctUnionOfListsInList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set distinctUnionOfArrays to (theArray's valueForKeyPath:"@distinctUnionOfArrays.self")
	return distinctUnionOfArrays as list
end distinctUnionOfListsInList:

-- For the given list, returns a list with all unique values.
on uniqueObjectsInList:theList
	set theArray to current application's NSArray's arrayWithArray:theList
	set uniqueValues to (theArray's valueForKeyPath:"@distinctUnionOfObjects.self") as list
	return uniqueValues as list
end uniqueObjectsInList:


-- RECORDS / DICTIONARIES

-- Creates and returns a new record from the given list of labels and values.
on recordFromLabels:labels andValues:values
	set theResult to current application's NSDictionary's dictionaryWithObjects:values forKeys:labels
	return theResult as record
end recordFromLabels:andValues:

-- Returns a list of all keys contained in the given record.
on keysOfRecord:theRecord
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	return theDict's allKeys() as list
end keysOfRecord:

-- Returns the value of the given key in the given record, or 'missing value' if the key was not found.
-- NOTE: This currently only works with values of these classes: text, list, record, date, integer, real.
on valueForKey:theKey inRecord:theRecord
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set theResult to theDict's valueForKey:theKey
	if theResult = missing value then
		return missing value
	else
		set classDesc to (current application's NSStringFromClass(theResult's |class|())) as string
		
		-- TODO: how to better inspect the class and coerce appropriately?
		if classDesc is "__NSArrayM" then
			return theResult as list
		else if classDesc is "__NSDictionaryM" then
			return theResult as record
		else if classDesc is "__NSCFString" or classDesc is "NSTaggedPointerString" then
			return theResult as text
		else if classDesc is "__NSTaggedDate" then
			return theResult as date
		else if classDesc is "__NSCFNumber" then
			if theResult's objCType() is "i" then
				return theResult as integer
			else
				return theResult as real
			end if
		else
			return theResult -- @warning this may return an uncoerced Cocoa class
		end if
	end if
end valueForKey:inRecord:

-- Sets the given value for the given key in the given record and returns the modified record.
-- Passing `missing value` as value will cause the item with the given key to be removed.
on setValue:theValue forKey:theKey inRecord:theRecord
	set theDict to current application's NSMutableDictionary's dictionaryWithDictionary:theRecord
	theDict's setValue:theValue forKey:theKey
	return theDict as record
end setValue:forKey:inRecord:

-- Adds the items from `otherRecord` to `theRecord` and returns the merged record. If both records
-- contain items with the same key, the value in `otherRecord` will replace the original value in `theRecord`.
on addItemsFromRecord:otherRecord toRecord:theRecord
	set theDict to current application's NSMutableDictionary's dictionaryWithDictionary:theRecord
	set otherDict to current application's NSDictionary's dictionaryWithDictionary:otherRecord
	theDict's addEntriesFromDictionary:otherDict
	return theDict as record
end addItemsFromRecord:toRecord:

-- Given a list of records, returns the first record whose record key of the given name matches the given value.
on recordForKey:theKey andValue:theValue inListOfRecords:theRecordList
	set theArray to current application's NSArray's arrayWithArray:theRecordList
	set thePred to current application's NSPredicate's predicateWithFormat:(theKey & " = %@") argumentArray:{theValue}
	set theResult to (theArray's filteredArrayUsingPredicate:thePred)
	if (count of theResult) is not 0 then
		return theResult's firstObject() as record -- return only first matching record
	else
		return missing value
	end if
end recordForKey:andValue:inListOfRecords:

-- Sorts the given record by its values in ascending order. Returns a list of the record’s labels, in the order they would be in if the record were sorted by its values.
-- 'selectorName' must be one of these: "compare:", or alternatively in case of string values being compared: "caseInsensitiveCompare:", "localizedCaseInsensitiveCompare:", "localizedCompare:", "localizedStandardCompare:"
on sortRecordByValue:theRecord usingSelector:selectorName
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set theArray to theDict's keysSortedByValueUsingSelector:selectorName
	return theArray as list
end sortRecordByValue:usingSelector:

-- Saves the given record to a plist file at the given POSIX path.
on saveRecord:theRecord toPlistAt:POSIXPath
	set theDict to current application's NSDictionary's dictionaryWithDictionary:theRecord
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	theDict's writeToFile:thePath atomically:true
	log result -- so we can see if it saved
end saveRecord:toPlistAt:

-- Returns the contents of the plist file at the given POSIX path. Note that the plist's root-level item must be a record (aka NSDictionary).
on readRecordPlistAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theDict to current application's NSDictionary's dictionaryWithContentsOfFile:thePath
	return theDict as record
end readRecordPlistAt:


-- XML

-- Returns a list of string values for all nodes matching the given XPath in the XML file at the given POSIX path.
on valueListForXPath:theXPath fromXMLAt:POSIXPath
	-- TODO: proper error handling
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set theXMLDoc to current application's NSXMLDocument's alloc()'s initWithContentsOfURL:theURL options:0 |error|:(missing value)
	set theNodeValues to theXMLDoc's nodesForXPath:theXPath |error|:(missing value)
	set theStringValues to theNodeValues's valueForKey:"stringValue"
	return theStringValues as list
end valueListForXPath:fromXMLAt:


-- JSON

-- Reads JSON data from the given .json file and returns the JSON data as a record,
-- or a list if the JSON root element is an array. Returns missing value if the JSON
-- data could not be parsed successfully.
-- @param aFilePOSIXPath POSIX path of the .json file to be parsed.
-- Credits: modified after script code by users alldritt, ComplexPoint & ShaneStanley @ https://forum.latenightsw.com/t/reading-json-data-with-nsjsonserialization/958
on readJSONFromFileAtPath(aFilePOSIXPath)
	set aFilePOSIXPath to my expandAbbreviatedFilePath(aFilePOSIXPath)
	if my fileExistsAtFilePath(aFilePOSIXPath) is false then return missing value
	
	set theJSONData to current application's NSData's dataWithContentsOfFile:aFilePOSIXPath
	set {theJSON, parseError} to current application's NSJSONSerialization's JSONObjectWithData:theJSONData options:0 |error|:(reference)
	
	if theJSON is missing value then
		return missing value
	else if theJSON's isKindOfClass:(current application's NSDictionary) then
		return theJSON as record
	else
		return theJSON as list
	end if
end readJSONFromFileAtPath

-- Reads the given JSON string and returns the parsed JSON data as a record,
-- or a list if the JSON root element is an array. Returns missing value if the JSON
-- data could not be parsed successfully.
-- @param jsonString The JSON string to be parsed.
-- Credits: modified after script code by users alldritt, ComplexPoint & ShaneStanley @ https://forum.latenightsw.com/t/reading-json-data-with-nsjsonserialization/958
on readJSONFromString(jsonString)
	if jsonString is missing value or jsonString is "" then return missing value
	
	set theJSONData to (current application's NSString's stringWithString:jsonString)'s dataUsingEncoding:(current application's NSUTF8StringEncoding)
	set {theJSON, parseError} to current application's NSJSONSerialization's JSONObjectWithData:theJSONData options:0 |error|:(reference)
	
	if theJSON is missing value then
		return missing value
	else if theJSON's isKindOfClass:(current application's NSDictionary) then
		return theJSON as record
	else
		return theJSON as list
	end if
end readJSONFromString


-- PDF

-- Returns a record of PDF document metadata for the PDF file at the given POSIX path.
on documentAttributesForPDFAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set thePDFDoc to current application's PDFDocument's alloc()'s initWithURL:theURL
	set theDocumentAttributes to thePDFDoc's documentAttributes
	return theDocumentAttributes as record
end documentAttributesForPDFAt:

-- Returns the value of the given document attribute for the PDF file at the given POSIX path.
on documentAttributeForKey:theKey fromPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	-- NOTE: valueForKey:inRecord: currently only supports text (NSString) values
	set theValue to my valueForKey:theKey inRecord:theDocumentAttributes
	if theValue = missing value then
		return missing value
	else
		return theValue
	end if
end documentAttributeForKey:fromPDFAt:

-- Returns the value of the "Title" document attribute (as text) for the PDF file at the given POSIX path.
on titleDocumentAttributeForPDFAt:POSIXPath
	set theTitle to my documentAttributeForKey:"Title" fromPDFAt:POSIXPath
	return theTitle as text
end titleDocumentAttributeForPDFAt:

-- Returns the value of the "Author" document attribute (as text) for the PDF file at the given POSIX path.
on authorDocumentAttributeForPDFAt:POSIXPath
	set theAuthor to my documentAttributeForKey:"Author" fromPDFAt:POSIXPath
	return theAuthor as text
end authorDocumentAttributeForPDFAt:

-- Returns the value of the "Subject" document attribute (as text) for the PDF file at the given POSIX path.
on subjectDocumentAttributeForPDFAt:POSIXPath
	set theSubject to my documentAttributeForKey:"Subject" fromPDFAt:POSIXPath
	return theSubject as text
end subjectDocumentAttributeForPDFAt:

-- Returns the value of the "Keywords" document attribute (as a list) for the PDF file at the given POSIX path.
on keywordsDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theKeywords to Keywords of theDocumentAttributes -- returns an error if key is not found
		return theKeywords
	on error
		return missing value
	end try
end keywordsDocumentAttributeForPDFAt:

-- Returns the value of the "Creator" document attribute (as text) for the PDF file at the given POSIX path.
on creatorDocumentAttributeForPDFAt:POSIXPath
	set theCreator to my documentAttributeForKey:"Creator" fromPDFAt:POSIXPath
	return theCreator as text
end creatorDocumentAttributeForPDFAt:

-- Returns the value of the "Producer" document attribute (as text) for the PDF file at the given POSIX path.
on producerDocumentAttributeForPDFAt:POSIXPath
	set theProducer to my documentAttributeForKey:"Producer" fromPDFAt:POSIXPath
	return theProducer as text
end producerDocumentAttributeForPDFAt:

-- Returns the value of the "ModDate" document attribute (as date) for the PDF file at the given POSIX path.
-- NOTE: this doesn't yet return a proper AppleScript date
on modificationDateDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theModDate to ModDate of theDocumentAttributes -- returns an error if key is not found
		return theModDate -- TODO: how to convert «class ocid» into an AppleScript date?
	on error
		return missing value
	end try
end modificationDateDocumentAttributeForPDFAt:

-- Returns the value of the "CreationDate" document attribute (as date) for the PDF file at the given POSIX path.
-- NOTE: this doesn't yet return a proper AppleScript date
on creationDateDocumentAttributeForPDFAt:POSIXPath
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	try
		set theCreationDate to CreationDate of theDocumentAttributes -- returns an error if key is not found
		return theCreationDate -- TODO: how to convert «class ocid» into an AppleScript date?
	on error
		return missing value
	end try
end creationDateDocumentAttributeForPDFAt:

-- Sets the given record as PDF document attributes for the PDF file at the given POSIX path.
-- Valid record labels: Title, Author, Subject, Keywords, Creator, Producer, ModDate, CreationDate
on setDocumentAttributes:attributeRecord forPDFAt:POSIXPath
	set thePath to current application's NSString's stringWithString:POSIXPath
	set thePath to thePath's stringByExpandingTildeInPath()
	set theURL to current application's NSURL's fileURLWithPath:thePath
	set thePDFDoc to current application's PDFDocument's alloc()'s initWithURL:theURL
	set theDict to current application's NSDictionary's dictionaryWithDictionary:attributeRecord
	thePDFDoc's setDocumentAttributes:theDict
	return thePDFDoc's writeToFile:thePath
end setDocumentAttributes:forPDFAt:

-- Sets the given value as a document attribute with the given key for the PDF file at the given POSIX path.
on setDocumentAttributeValue:theValue forKey:theKey fromPDFAt:POSIXPath
	-- TODO: this loads the PDF twice (once for reading and once for writing)
	set theDocumentAttributes to my documentAttributesForPDFAt:POSIXPath
	set theDict to current application's NSMutableDictionary's dictionaryWithDictionary:theDocumentAttributes
	theDict's setValue:theValue forKey:theKey
	return my setDocumentAttributes:(theDict as record) forPDFAt:POSIXPath
end setDocumentAttributeValue:forKey:fromPDFAt:

-- Sets the value of the "Title" document attribute for the PDF file at the given POSIX path.
on setTitleDocumentAttribute:theTitle forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theTitle forKey:"Title" fromPDFAt:POSIXPath
end setTitleDocumentAttribute:forPDFAt:

-- Sets the value of the "Author" document attribute for the PDF file at the given POSIX path.
on setAuthorDocumentAttribute:theAuthor forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theAuthor forKey:"Author" fromPDFAt:POSIXPath
end setAuthorDocumentAttribute:forPDFAt:

-- Sets the value of the "Subject" document attribute for the PDF file at the given POSIX path.
on setSubjectDocumentAttribute:theSubject forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theSubject forKey:"Subject" fromPDFAt:POSIXPath
end setSubjectDocumentAttribute:forPDFAt:

-- Sets the value of the "Keywords" document attribute for the PDF file at the given POSIX path.
on setKeywordsDocumentAttribute:theKeywords forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theKeywords forKey:"Keywords" fromPDFAt:POSIXPath
end setKeywordsDocumentAttribute:forPDFAt:

-- Sets the value of the "Creator" document attribute for the PDF file at the given POSIX path.
on setCreatorDocumentAttribute:theCreator forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theCreator forKey:"Creator" fromPDFAt:POSIXPath
end setCreatorDocumentAttribute:forPDFAt:

-- Sets the value of the "Producer" document attribute for the PDF file at the given POSIX path.
-- NOTE: Producer will be always set to "Mac OS X 10.9.2 Quartz PDFContext"
(*
on setProducerDocumentAttribute:theProducer forPDFAt:POSIXPath
	return my setDocumentAttributeValue:theProducer forKey:"Producer" fromPDFAt:POSIXPath
end setProducerDocumentAttribute:forPDFAt:
*)

-- Returns any DOI extracted from the given PDF's "Subject", "Title" or "Keywords" attributes,
-- or from the PDF's first page (if `scanFirstPage` is `true`). Returns an empty string if no
-- DOI could be found.
-- @pdfPath pdfPath The POSIX path to the PDF file on disk, must be given if pdfDoc is empty.
-- @pdfDoc The PDFDocument object (preferred if available), must be given if pdfPath is empty.
-- @scanFirstPage Specifies whether the PDF's first page shall also be searched for a DOI
-- (`true`) or not `false`.
on doiFromPDF(pdfPath, pdfDoc, scanFirstPage)
	if pdfDoc is missing value or pdfDoc is "" then
		if pdfPath is missing value or pdfPath is "" then return ""
		set pdfDoc to current application's PDFDocument's alloc()'s initWithURL:(current application's |NSURL|'s fileURLWithPath:pdfPath)
	end if
	if pdfDoc is missing value then return ""
	
	set pdfDOI to ""
	
	-- try to get any DOI from PDF metadata
	set pdfDocAttributes to pdfDoc's documentAttributes as record
	
	set pdfSubject to my valueForKey:"Subject" inRecord:pdfDocAttributes
	if pdfSubject is not missing value and pdfSubject is not "" then
		set pdfDOI to my matchDOI(pdfSubject)
	end if
	
	set pdfTitle to my valueForKey:"Title" inRecord:pdfDocAttributes
	if pdfDOI is "" and pdfTitle is not missing value and pdfTitle is not "" then
		set pdfDOI to my matchDOI(pdfTitle)
	end if
	
	set pdfKeywords to my valueForKey:"Keywords" inRecord:pdfDocAttributes
	if pdfDOI is "" and pdfKeywords is not missing value and pdfKeywords is not {} then
		repeat with aKeyword in pdfKeywords
			if pdfDOI is "" then set pdfDOI to my matchDOI(aKeyword)
		end repeat
	end if
	
	-- try to get any DOI from first PDF page
	if pdfDOI is "" and scanFirstPage is true then
		set pdfPage to (pdfDoc's pageAtIndex:0)
		set pageText to pdfPage's |string|()
		
		if pageText is not (current application's NSNull's |null|) then
			set pdfDOI to my matchDOI(pageText)
		end if
	end if
	
	return pdfDOI
end doiFromPDF


-- PDF ANNOTATIONS

-- Decimal numbers that specify how much the bounding box encompassing an annotation's
-- individual line shall be enlarged vertically & horizontally so that it fully covers all text
-- highlighted on that line.
-- If you find that this script somehow fails to fully extract all of an annotation's text (or if
-- it extracts too much) then you may want to adjust these decimal numbers (e.g. by 0.1
-- increments).
-- However, note that larger values will increase the likeliness that adjacent characters not
-- belonging to the annotation will get included as well.
property lineWidthEnlargement : 0.7
property lineHeightEnlargement : 1.7

-- Defines lower and upper hue limits for common colors. Limit values are inclusive and must be
-- given as degrees (0-359) of the hue in the HSB (hue, saturation, brightness) color scheme.
property redColorMapping : {colorName:"red", lowerHueLimit:350, upperHueLimit:19}
property orangeColorMapping : {colorName:"orange", lowerHueLimit:20, upperHueLimit:44}
property yellowColorMapping : {colorName:"yellow", lowerHueLimit:45, upperHueLimit:65}
property greenColorMapping : {colorName:"green", lowerHueLimit:66, upperHueLimit:164}
property cyanColorMapping : {colorName:"cyan", lowerHueLimit:165, upperHueLimit:184}
property lightBlueColorMapping : {colorName:"light blue", lowerHueLimit:185, upperHueLimit:209}
property darkBlueColorMapping : {colorName:"dark blue", lowerHueLimit:210, upperHueLimit:254}
property purpleColorMapping : {colorName:"purple", lowerHueLimit:255, upperHueLimit:324}
property pinkColorMapping : {colorName:"pink", lowerHueLimit:325, upperHueLimit:349}

property colorMappings : {redColorMapping, orangeColorMapping, yellowColorMapping, greenColorMapping, cyanColorMapping, lightBlueColorMapping, darkBlueColorMapping, purpleColorMapping, pinkColorMapping}

-- Set to `true` if you want this script to associate annotations to text columns in multi-column
-- PDF layouts when generating sort identifiers.
-- Sort identifiers can be used for sorting so that annotations are listed in the order they appear
-- in the text of a page (optionally respecting a multi-column layout).
-- Sort identifier format: `<PAGE>-<COLUMN>-<POSITION_FROM_TOP>` (e.g. "2-1-207").
-- If this property is set to `false`, `<COLUMN>` will be always "1".
-- Note that, depending on the layout of the PDF page and the specific annotation's width,
-- correctly guessing the annotation's text column may still fail.
property respectMultiColumnPDFLayouts : true

-- The number of text columns supported by this script when generating sort identifiers.
-- If you're often dealing with PDF text layouts that have more than the specified number of text
-- columns then you may want to adjust this integer number. However, note that larger values
-- will increase the likeliness that short annotations or annotations from document parts
-- spanning multiple columns (like the abstract) won't sort correctly.
property maxTextColumns : 2

-- Approximate average width of the (left or right) white space between text & page origin/end.
-- Note that this is just a wild guess for the average margin of a PDF page as properly calculating
-- margins isn't straightforward. However, specifying some value for an average margin usually
-- helps when trying to associate annotations to text columns in multi-column PDF layouts.
property pageMargin : 20

-- For the PDF at the given file path, returns a list of records (where each record contains
-- info about one of its PDF annotations) as well as any DOI extracted from the PDF
-- metadata or its first page.
-- @param pdfPath The POSIX path to the PDF file on disk.
-- @param pdfurl The URL of the PDF (may be empty). This URL may be a http(s)://
-- URL or use an app's custom URL scheme. As an example for the latter, you could
-- pass the `x-devonthink-item://...` URL of the corresponding PDF record in
-- DEVONthink. In case of a `x-devonthink-item://...` URL, this method will also
-- append annotation info (page no., annotation type & x/y position) via parameters
-- to the given URL.
-- @param sourceDOI The DOI of the publication represented by the PDF (may be
-- empty).
-- @param sourceCitekey The citekey of the publication represented by the PDF (may
-- be empty).
-- Note that the actual return value is a list with two items with the first item being the
-- list of annotation info records and the second item being a string value containing the
-- given DOI, or the DOI extracted from PDF metadata/first page, or else an empty string:
-- `{pdfAnnotationsArray, sourceDOI}`
-- Credits: this method was inspired by a script by mdbraber
-- See https://discourse.devontechnologies.com/t/stream-annotations-from-your-pdf-reading-sessions-with-devonthink/70727/30
on pdfAnnotationInfo(pdfPath, pdfurl, sourceDOI, sourceCitekey)
	if my fileExistsAtFilePath(pdfPath) is false then return {{}, sourceDOI}
	if type identifier of (info for pdfPath) is not "com.adobe.pdf" then return {{}, sourceDOI}
	
	set pdfDoc to current application's PDFDocument's alloc()'s initWithURL:(current application's |NSURL|'s fileURLWithPath:pdfPath)
	if pdfDoc is missing value then return {{}, sourceDOI}
	
	-- if there's no given DOI yet, try to get any DOI from PDF metadata or first PDF page
	if sourceDOI is "" then
		set pdfDOI to my doiFromPDF(pdfPath, pdfDoc, true)
		if pdfDOI is not "" then
			set sourceDOI to pdfDOI
		end if
	end if
	
	-- iterate over each PDF page and process its annotations
	set pdfAnnotationsArray to current application's NSMutableArray's new()
	set columnID to 1
	repeat with i from 0 to ((pdfDoc's |pageCount|()) - 1) -- PDF pages are 0-based in PDFKit
		set pdfPage to (pdfDoc's pageAtIndex:i)
		set {pageWidth, pageHeight} to item 2 of (pdfPage's boundsForBox:(current application's kPDFDisplayBoxMediaBox))
		set columnWidth to (pageWidth - (2 * pageMargin)) / maxTextColumns
		set pageLabel to pdfPage's label()
		set pdfannotations to pdfPage's annotations()
		
		repeat with pdfAnnotation in pdfannotations
			set annotType to pdfAnnotation's |type|()
			
			if annotType is in {"Highlight", "StrikeOut", "Underline", "Squiggly", "Text", "FreeText"} then
				if annotType is in {"Highlight", "StrikeOut", "Underline"} then
					set markupType to pdfAnnotation's markupType()
				else
					set markupType to missing value
				end if
				
				-- get the annotation's color
				set annotColor to my colorForAnnotation(pdfAnnotation)
				set annotColorName to my colorNameForColor(annotColor)
				
				-- get the annotation's creator name as well as its modification & creation dates
				set annotUserName to pdfAnnotation's userName()
				set annotModDate to pdfAnnotation's modificationDate()
				if annotModDate is missing value or annotModDate is (current application's NSNull's |null|) then set annotModDate to current application's NSDate's |date|() -- use current date if no modification date is specified
				
				-- parse & set key/value pairs from dictionary returned by `annotationKeyValues`
				-- TODO: parse `/Name` if it contains something more concrete than just "/Note" (example: `/Name:"/Note"`)
				set annotKeyDict to pdfAnnotation's annotationKeyValues()
				set annotCreatedDateString to (annotKeyDict's valueForKey:"/CreationDate") as string -- e.g.: `/CreationDate:"D:20240810112845Z"`, set by DTTG but not DT/PDFKit on Mac?
				if annotCreatedDateString is not missing value then
					set annotCreatedDate to my dateFromPDFDate(annotCreatedDateString, annotModDate as date)
				else
					set annotCreatedDate to annotModDate
				end if
				
				-- get annotation bounds
				set annotBounds to pdfAnnotation's |bounds|()
				set {annotOriginX, annotOriginY} to first item of annotBounds -- origin
				set {annotWidth, annotHeight} to second item of annotBounds -- size
				
				-- calculate a string identifier that can be used for sorting (so that annotations can be listed in the order they appear in the text of a page)
				-- NOTE: including a `columnID` allows to better sort annotations in multi-column PDF articles
				set annotTopMarginFromTop to round (pageHeight - (annotOriginY + annotHeight)) rounding as taught in school -- in page space, the origin lies at the lower-left corner of the PDF page
				if respectMultiColumnPDFLayouts is true then set columnID to 1 + (round (annotOriginX / columnWidth) rounding down) -- the identifier of the column containing this annotation's origin
				set sortString to "" & i + 1 & "-" & columnID & "-" & annotTopMarginFromTop
				
				-- get the annotation's highlighted text
				if annotType is in {"Highlight", "StrikeOut", "Underline", "Squiggly"} then
					set quadPoints to pdfAnnotation's quadrilateralPoints()
					set boundsByLine to my annotationBoundsByLine(quadPoints, annotBounds)
					set annotText to my annotationText(pdfPage, boundsByLine)
				else
					set annotText to ""
				end if
				
				set annotComment to pdfAnnotation's |contents|()
				
				-- for a DEVONthink URL, create a deep link for this annotation
				set annotURL to pdfurl
				if annotURL is not "" and annotURL is not missing value and annotURL starts with "x-devonthink-item://" then
					set annotURL to pdfurl & ¬
						"?page=" & i & ¬
						"&annotation=" & annotType & ¬
						"&x=" & (annotOriginX as integer) & ¬
						"&y=" & (annotOriginY as integer)
				end if
				
				(pdfAnnotationsArray's addObject:{citekey:sourceCitekey, page:i, pageLabel:pageLabel, annotType:annotType, markupType:markupType, annotColor:annotColor, annotColorName:annotColorName, userName:annotUserName, createdDate:annotCreatedDate, modifiedDate:annotModDate, annotText:annotText, comment:annotComment, deepLink:annotURL, sortString:sortString, positionFromTop:annotTopMarginFromTop})
			end if
		end repeat
	end repeat
	
	return {pdfAnnotationsArray as list, sourceDOI}
end pdfAnnotationInfo

-- Return's the PDF annotation's color as a NSColor object, or returns `missing value`
-- if the annotation's color could not be determined.
-- Note that this method currently only supports these annotation types:
--  "Highlight", "StrikeOut", "Underline", "Squiggly", "Text" & "FreeText"
-- @param pdfAnnotation The PDFAnnotation object that shall be processed.
on colorForAnnotation(pdfAnnotation)
	if pdfAnnotation is missing value then return missing value
	
	set annotColor to missing value
	set annotType to pdfAnnotation's |type|()
	set annotKeyDict to pdfAnnotation's annotationKeyValues()
	
	if (annotType as string) is in {"FreeText"} then
		set defaultStyle to (annotKeyDict's valueForKey:"/DS") as string -- e.g.: NSString "font-family: Helvetica; font-size: 12pt; color: #FF4015"
		if defaultStyle is not missing value then
			set hexColorString to my regexMatch(defaultStyle, "#[0-9A-F]{6}")
			if hexColorString is not "" then
				set {theRed, theGreen, theBlue} to (my RGBColorFromHexColor:hexColorString)
				set annotColor to (current application's NSColor's colorWithRed:theRed / 255 green:theGreen / 255 blue:theBlue / 255 alpha:1.0)
			end if
		else -- if "/DS" isn't available fallback to "/DA"
			set defaultAppearance to (annotKeyDict's valueForKey:"/DA") as string -- e.g.: NSString "/Helvetica 12 Tf 1.000 0.251 0.082 rg"
			if defaultAppearance is not missing value then
				set colorRegex to ".*? (\\d+\\.\\d+) (\\d+\\.\\d+) (\\d+\\.\\d+).*"
				if (my regexMatch(defaultAppearance, colorRegex)) is not "" then
					set theRed to my regexReplace(defaultAppearance, colorRegex, "$1")
					set theGreen to my regexReplace(defaultAppearance, colorRegex, "$2")
					set theBlue to my regexReplace(defaultAppearance, colorRegex, "$3")
					set annotColor to (current application's NSColor's colorWithRed:theRed green:theGreen blue:theBlue alpha:1.0)
				end if
			end if
		end if
	else
		set annotColor to pdfAnnotation's |color|()
	end if
	
	return annotColor
end colorForAnnotation

-- Attempts to extract the annotation's text from its line-based bounds rectangles.
-- @param pdfPage PDFPage object which hosts the PDF annotation and its text.
-- @param boundsByLine List of line-based bounds, where each bounds rectangle
-- specifies the bounding box of an annotation's individual line in page space.
on annotationText(pdfPage, boundsByLine)
	set textByLine to {}
	
	repeat with theBounds in boundsByLine
		set pdfSelection to (pdfPage's selectionForRect:theBounds)
		set lineText to pdfSelection's |string|()
		
		if lineText is not (current application's NSNull's |null|) and lineText is not missing value and lineText is not "" then
			-- replace any trailing whitespace or "\n" at the end of a line with a single space
			set lineText to my regexReplace(lineText as string, "(\\s+|\\\\n)$", " ")
			
			-- assume that a hyphen (and optional space) at the end of a line indicates a word hyphenation
			-- NOTE: while this assumption is often correct, it's not always true so it may incorrectly merge
			--           hyphenated words
			set lineText to my regexReplace(lineText, "- $", "")
			
			copy lineText to end of textByLine
		end if
	end repeat
	
	return my mergeTextItems(textByLine, "")
end annotationText

-- Converts a list of quadrilateral points to a list of line-based bounds, where each bounds
-- rectangle specifies the bounding box of an annotation's individual line in page space.
-- @param quadPoints List of quadrilateral points (as obtained by `pdfAnnotation's quadrilateralPoints()`,
-- with each point wrapped as NSValue object) where each quadrilateral (i.e., a group of four consecutive
-- points ordered in Z-form {topLeft, topRight, bottomLeft, bottomRight} so that points with higher
-- y-values come first) encircles a line of text to be highlighted. The coordinates of each point are relative
-- to the bound’s origin of the markup annotation.
-- @param annotationBounds The bounding box for the annotation in page space (which is a 72 dpi
-- coordinate system with the origin at the lower-left corner of the PDF page), as obtained by
-- `pdfAnnotation's |bounds|()`.
on annotationBoundsByLine(quadPoints, annotationBounds)
	set theOrigin to first item of annotationBounds -- a point specified as a list of x/y positions: {xPos, YPos}
	set boundsByLine to {}
	set maxQuadCount to (count of quadPoints) / 4
	set quadCount to 1
	
	-- iterate over each quadrilateral (4 points: topLeft, topRight, bottomLeft, bottomRight) representing an
	-- annotation line and get its bounds in page space
	repeat maxQuadCount times
		-- get the top left & bottom right quad points for this annotation line
		set topLeftPoint to (item quadCount of quadPoints)'s pointValue()
		set bottomRightPoint to (item (quadCount + 3) of quadPoints)'s pointValue()
		
		-- convert each quad point (whose coordinates are relative to the bound’s origin of the markup
		-- annotation) to page space (where the origin lies at the lower-left corner of the PDF page)
		-- NOTE: w/o the adjustment of values, the rectangle would be too small to match underlying text
		set x of topLeftPoint to (x of topLeftPoint) + (first item of theOrigin) - lineWidthEnlargement
		set y of topLeftPoint to (y of topLeftPoint) + (second item of theOrigin) + lineHeightEnlargement
		
		set x of bottomRightPoint to (x of bottomRightPoint) + (first item of theOrigin) + lineWidthEnlargement
		set y of bottomRightPoint to (y of bottomRightPoint) + (second item of theOrigin) - lineHeightEnlargement
		
		-- create a bounds rectangle (specified by origin {x,y} & size {width,height}) for this annotation line
		set lineBounds to my makeNSRect({{x of topLeftPoint, y of topLeftPoint}, {x of bottomRightPoint, y of bottomRightPoint}})
		copy lineBounds to end of boundsByLine
		
		set quadCount to quadCount + 4
	end repeat
	
	return boundsByLine
end annotationBoundsByLine

-- Takes a a rectangle specified via its top left & bottom right points (given as a list of lists:
-- {{topLeftX, topLeftY}, {bottomRightX, bottomRightY}}) and converts it to a bounds rectangle
-- given as a record with `origin` & `size` properties each containing again a record:
-- {origin:{x:topLeftX, y:topLeftY}, |size|:{width:bottomRightX-topLeftX, height:bottomRightY-topLeftY}} 
-- Credits: by Takaaki Naganoya, Piyomaru Software (see http://piyocast.com/as/archives/643)
on makeNSRect(aList as list)
	try
		copy aList to {{x1, y1}, {x2, y2}}
		set xWidth to (x2 - x1)
		set yHeight to (y2 - y1) -- TODO: doesn't this create a negative height? use `y1 - y2` instead?
		set a1Rect to {origin:{x:x1, y:y1}, |size|:{width:xWidth, height:yHeight}}
		return a1Rect
	on error
		return missing value
	end try
end makeNSRect


-- DATES

-- Converts a "PDF date" (like "D:20241231235959Z") into an AppleScript date & returns it.
-- The PDF standard uses a date format that closely follows the international standard ASN.1
-- (Abstract Syntax Notation One), defined in ISO/IEC 8824. An ASN.1-formatted "PDF date"
-- may, for example, occur as the value of the `/CreationDate` dictionary entry in an annotation
-- dictionary for a markup annotation.
-- @param pdfDateString The ASN.1-formatted "PDF date" to be parsed.
-- @param fallbackDate An AppleScript date whose date components will be used for components
-- that are undefined in the given PDF date.
on dateFromPDFDate(pdfDateString, fallbackDate)
	if fallbackDate is not missing value then
		set aDate to fallbackDate
	else
		set aDate to current date
	end if
	
	set pdfDateRegex to "^(?:D:)?(\\d{4})(\\d{2})?(\\d{2})?(\\d{2})?(\\d{2})?(\\d{2})?.*"
	
	set pdfDateYear to (my regexReplace(pdfDateString, pdfDateRegex, "$1"))
	if length of pdfDateYear = 4 then set year of aDate to pdfDateYear
	
	set pdfDateMonth to (my regexReplace(pdfDateString, pdfDateRegex, "$2"))
	if length of pdfDateMonth = 2 then set month of aDate to pdfDateMonth
	
	set pdfDateDay to (my regexReplace(pdfDateString, pdfDateRegex, "$3"))
	if length of pdfDateDay = 2 then set day of aDate to pdfDateDay
	
	set pdfDateHours to (my regexReplace(pdfDateString, pdfDateRegex, "$4"))
	if length of pdfDateHours = 2 then set hours of aDate to pdfDateHours
	
	set pdfDateMinutes to (my regexReplace(pdfDateString, pdfDateRegex, "$5"))
	if length of pdfDateMinutes = 2 then set minutes of aDate to pdfDateMinutes
	
	set pdfDateSeconds to (my regexReplace(pdfDateString, pdfDateRegex, "$6"))
	if length of pdfDateSeconds = 2 then set seconds of aDate to pdfDateSeconds
	
	-- NOTE: In a "PDF date", a trailing letter Z signifies that local time is equal to UT.
	-- However, some PSPDFKit(?) apps (like DEVONthink To Go) use this format with
	-- UTC dates. In any case, the below line may not be correct.
	if pdfDateString ends with "Z" then set aDate to aDate + (time to GMT)
	
	return aDate
end dateFromPDFDate

-- Converts the given NSDate object into a corresponding AppleScript date and returns it.
-- @param nsDate The NSDate object to be converted into an AppleScript date.
-- Credits: modified after script code by user Shane_Stanley @ https://www.macscripter.net/t/working-with-nsdate-objects-as-readable-as-values/56336/19
-- @see also https://forum.latenightsw.com/t/converting-dates/878
on dateFromNSDate(NSDate)
	set theDiff to NSDate's timeIntervalSinceReferenceDate()
	set referenceDateString to "01/01/2001 00:00:00"
	set asDate to (date referenceDateString) + theDiff div 1 + (time to GMT)
	return asDate
end dateFromNSDate


-- DATA

-- Credits: Data conversion methods by Shane Stanley, see https://forum.latenightsw.com/t/convert-nsdata-into-raw-data-string/1914/4

-- Returns an NSData object converted from the given AppleScript data
on dataFromASData:asData
	return (current application's NSArray's arrayWithObject:asData)'s firstObject()'s |data|()
end dataFromASData:

-- Returns AppleScript data converted from the given NSData object
on ASDataFromData:theData
	set theCode to current application's NSHFSTypeCodeFromFileType("'rdat'")
	return (current application's NSAppleEventDescriptor's descriptorWithDescriptorType:theCode |data|:theData) as data
end ASDataFromData:


-- FINDER TAGS

-- Credits: Tag-related methods by Shane Stanley, see http://macscripter.net/viewtopic.php?id=41892

-- Returns the tags of the file at the given POSIX path.
on returnTagsFor:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	set {theResult, theTags} to theURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
	if theTags = missing value then return {} -- when there are none, it returns missing value
	return theTags as list
end returnTagsFor:

-- Replaces the tags of the file at the given POSIX path with the given tags.
-- @param tagList The full list of tags to be set for the specified file; may be empty
on setTags:tagList forPath:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	theURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
end setTags:forPath:

-- Adds the given tags to the tags assigned to the file at the given POSIX path.
-- @param tagList The list of tags to be added for the specified file; may be empty
on addTags:tagList forPath:POSIXPath
	set theURL to current application's |NSURL|'s fileURLWithPath:POSIXPath
	-- get existing tags
	set {theResult, theTags} to theURL's getResourceValue:(reference) forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
	if theTags ≠ missing value then -- add new tags
		set tagList to (theTags as list) & tagList
		set tagList to (current application's NSOrderedSet's orderedSetWithArray:tagList)'s allObjects() -- delete any duplicates
	end if
	theURL's setResourceValue:tagList forKey:(current application's NSURLTagNamesKey) |error|:(missing value)
end addTags:forPath:


-- COLOR

-- Returns the name of the approximate color (like "red", "blue", "green", etc) for the
-- given NSColor object.
-- @param aColor NSColor object whose color name shall be determined.
on colorNameForColor(aColor)
	if aColor is missing value then return ""
	
	set colorName to ""
	
	if aColor's colorSpace is not (current application's NSColorSpace's deviceRGBColorSpace()) then
		set aColor to (aColor's colorUsingColorSpace:(current application's NSColorSpace's deviceRGBColorSpace()))
	end if
	
	-- approximate the name of the annotation's color via the degree of the hue in the HSB (hue, saturation, brightness) color scheme
	set hueDegree to round ((aColor's hueComponent() as number) * 360) rounding as taught in school
	set colorName to my colorNameForHue(hueDegree)
	
	return colorName
end colorNameForColor

-- Returns the name of the approximate color (like "red", "blue", "green", etc) for the
-- given hue degree.
-- @param hueDegree A color's hue component given as a degree (0-359) of the hue 
-- in the HSB (hue, saturation, brightness) color scheme.
on colorNameForHue(hueDegree)
	set colorName to ""
	
	repeat with colorMapping in colorMappings
		if hueDegree ≥ colorMapping's lowerHueLimit and hueDegree ≤ colorMapping's upperHueLimit then
			set colorName to colorMapping's colorName
		end if
	end repeat
	if colorName is "" and (hueDegree ≥ colorMapping's lowerHueLimit or hueDegree ≤ colorMapping's upperHueLimit) then
		set colorName to redColorMapping's colorName
	end if
	
	return colorName
end colorNameForHue


-- COLOR CONVERSIONS

-- Credits: Modified after methods by Shane Stanley (see https://forum.latenightsw.com/t/how-to-get-rgb-from-string/3329/12)
--              and Stefan Klieme (see https://www.macscripter.net/t/convert-colors/50767/5)

-- Returns the RGB color equivalent of the given hex color string.
-- A RGB color is represented by a list of three values (each between 0 and 255): red, green and blue.
-- For example, a light yellowish orange with a hex color value of `#F7C809` would give a RGB value of `{247, 200, 9}`,
-- and a bright red with a hex color value of `#fa0007` would give a RGB value of `{250, 0, 7}`.
-- @param hexColorString The hex color string to be converted, formatted as "#xxxxxx" with x being one of "0123456789ABCDEF"
on RGBColorFromHexColor:hexColorString
	set {theResult, theRed} to (current application's NSScanner's scannerWithString:(text -6 thru -5 of hexColorString))'s scanHexInt:(reference)
	set {theResult, theGreen} to (current application's NSScanner's scannerWithString:(text -4 thru -3 of hexColorString))'s scanHexInt:(reference)
	set {theResult, theBlue} to (current application's NSScanner's scannerWithString:(text -2 thru -1 of hexColorString))'s scanHexInt:(reference)
	
	set theColor to current application's NSColor's colorWithRed:theRed / 255 green:theGreen / 255 blue:theBlue / 255 alpha:1.0
	
	return {theRed, theGreen, theBlue}
end RGBColorFromHexColor:

-- Returns the HSV color equivalent of the given hex color string.
-- A HSV color is represented by a list of three values: hue (color angle between 0 and 360), saturation (percent) and brightness value (percent).
-- For example, a light yellowish orange with a hex color value of `#F7C809` would give a HSV value of `{48, 96, 97}`,
-- and a bright red with a hex color value of `#fa0007` would give a HSV value of `{358, 100, 98}`.
-- @param hexColorString The hex color string to be converted, formatted as "#xxxxxx" with x being one of "0123456789ABCDEF"
on HSVColorFromHexColor:hexColorString
	set {theResult, theRed} to (current application's NSScanner's scannerWithString:(text -6 thru -5 of hexColorString))'s scanHexInt:(reference)
	set {theResult, theGreen} to (current application's NSScanner's scannerWithString:(text -4 thru -3 of hexColorString))'s scanHexInt:(reference)
	set {theResult, theBlue} to (current application's NSScanner's scannerWithString:(text -2 thru -1 of hexColorString))'s scanHexInt:(reference)
	
	set theColor to current application's NSColor's colorWithRed:theRed / 255 green:theGreen / 255 blue:theBlue / 255 alpha:1.0
	
	set theHue to round ((theColor's hueComponent()) * 360)
	set theSaturation to round ((theColor's saturationComponent()) * 100)
	set theBrightness to round ((theColor's brightnessComponent()) * 100)
	
	return {theHue, theSaturation, theBrightness}
end HSVColorFromHexColor:

-- Returns the Apple RGB 16 bit value equivalent of the given hex color string.
-- An Apple RGB 16 bit color is represented by a list of three values (each between 0 and 2^16 - 1 (65,535)).
-- For example, a light yellowish orange with a hex color value of `#F7C809` would give a RGB 16 bit value of `{63479, 51400, 2313}`,
-- and a bright red with a hex color value of `#fa0007` would give a RGB 16 bit value of `{64250, 0, 1799}`.
-- @param hexColorString The hex color string to be converted, formatted as "#xxxxxx" with x being one of "0123456789ABCDEF"
on RGB16ColorFromHexColor(hexColorString)
	set hexList to "0123456789ABCDEF"
	set rgb16Color to {}
	
	repeat with i from 2 to 6 by 2
		set end of rgb16Color to ((((offset of hexColorString's character i in hexList) - 1) * 16) + (offset of hexColorString's character (i + 1) in hexList) - 1) * 257
	end repeat
	
	return rgb16Color
end RGB16ColorFromHexColor

-- Returns the hex color string equivalent of the given Apple RGB 16 bit value.
-- An Apple RGB 16 bit color is represented by a list of three values (each between 0 and 2^16 - 1 (65,535)).
-- For example, a light yellowish orange with a RGB 16 bit value of `{63479, 51400, 2313}` would give a hex color value of `"#F7C809"`,
-- and a bright red with a RGB 16 bit value of `{64250, 0, 1799}` would give a hex color value of `#FA0007`.
-- @param rgb16Color The Apple RGB 16 bit value to be converted
on HexColorFromRGB16Color(rgb16Color) -- format: {63479, 51400, 2313}
	set hexList to "0123456789ABCDEF"
	set hexColorString to "#"
	
	repeat with primary in rgb16Color
		set hexColorString to hexColorString & character (primary div 4096 + 1) of hexList & character (primary div 256 mod 16 + 1) of hexList
	end repeat
	
	return hexColorString
end HexColorFromRGB16Color


-- MARKDOWN

-- Returns all Markdown-style headings extracted from the given source string.
-- Note that this method only recognizes headings starting with `#`.
-- The `headingPrefix` parameter indicates the heading level from which headings
-- shall be extracted, and must be one of:
-- - "#"
-- - "##"
-- - "###"
-- - "####"
-- - "#####"
-- - "######"
-- Headings of the same level are returned as a list of records where each record has
-- these record elements:
-- - `heading`: the actual heading string
-- - `children`: a list of records for any subheadings, or an empty list if there are none
on markdownHeadingsFromText(sourceString, headingPrefix)
	set headingsList to {}
	set splitSeparator to "___|HEADING|___"
	set headingPrefixTemplate to "######"
	
	-- TODO: make use of the regexSplit() method instead
	set splitOnHeadingRegex to "(?<=^|[\\r\\n])(?=" & headingPrefix & "[ \\t]+.+)"
	set headingRegex to "^" & headingPrefix & "[ \\t]+(.+)"
	
	set theString to my regexReplace(sourceString, splitOnHeadingRegex, splitSeparator)
	
	if theString contains splitSeparator then
		-- get all headings together with their subordinate paragraphs & child headings
		set headingBlocks to my splitText(theString, splitSeparator)
		
		repeat with headingBlock in headingBlocks
			set theHeading to my regexMatch(headingBlock, headingRegex)
			if theHeading is not "" then
				set theHeading to my regexReplace(theHeading, headingRegex, "$1")
				
				-- get all child headings for this heading block
				if ((count of headingPrefix) + 1) ≤ (count of headingPrefixTemplate) then
					set childHeadingPrefix to (characters 1 thru ((count of headingPrefix) + 1) of headingPrefixTemplate) as string
					set subHeadingsList to my markdownHeadingsFromText(headingBlock, childHeadingPrefix)
				else
					set subHeadingsList to {}
				end if
				
				copy {heading:theHeading, children:subHeadingsList} to end of headingsList
			end if
		end repeat
	end if
	
	return headingsList
end markdownHeadingsFromText


-- KEYPOINTS

-- Returns the first DOI extracted from the given string, or an empty string if no
-- DOI could be found.
on matchDOI(aString)
	if aString is missing value or aString is "" then return ""
	
	-- Note that we could also use `\\S+[-+)\\w]` to match the DOI suffix but the more restrictive pattern below
	-- helps to better match DOIs in URLs (like `…=10.1038/35088167&link_type=DOI`).
	-- @warning Note that this pattern won't match SICI DOIs nor DOIs containing `&`, but it may match a trailing
	-- parenthesis which is not part of the actual DOI.
	-- @see https://www.crossref.org/blog/dois-and-matching-regular-expressions/
	set doiRegex to "(?i)\\b10\\.\\d{4,9}(?:\\.[\\.\\w]+)*/[-._;()/:\\w]+[-+)\\w]"
	
	set aDOI to my regexMatch(aString, doiRegex)
	
	return aDOI as string
end matchDOI

-- Returns `true` if the given note text contains a Keypoints-style metadata line
-- (i.e., a line prefixed with `< `) which contains the `@:flagged` attribute,
-- otherwise returns `false`.
on keypointsNoteIsMarkedAsFlagged(aNote)
	if aNote is missing value or aNote is "" then return false
	
	if my regexMatch(aNote, "(?<=^|[\\r\\n])< .*?@:flagged") is not "" then
		return true
	end if
	
	return false
end keypointsNoteIsMarkedAsFlagged

-- Returns an integer between 0 and 5 which represents a star rating that's contained
-- on a Keypoints-style metadata line (i.e., a line prefixed with `< `) of the given note
-- text, otherwise returns `false`.
on keypointsNoteRatingNumber(aNote)
	if aNote is missing value or aNote is "" then return 0
	
	set ratingString to my regexMatch(aNote, "(?<=^< |[\\r\\n]< )[*★]{1,5}")
	if ratingString is not "" then
		return count of ratingString
	end if
	
	return 0
end keypointsNoteRatingNumber

-- Returns all quotation lines (i.e., lines prefixed with `> `) from the given note.
-- Note that this returns a list of lists where each sublist contains a block of (originally)
-- consecutive quotation lines.
on quotationLinesFromKeypointsNote(aNote)
	if aNote is missing value or aNote is "" then return {}
	
	set quotationBlocks to {}
	set quotationBlocks to my regexSplit(aNote, "(?:^|[\\r\\n]+)((?!> ).+[\\r\\n]+)+") -- remove all non-empty lines between blocks of quotation lines
	set quotationBlocks to (my removeEmptyStringsFromList:(quotationBlocks as list)) -- removes empty lines
	
	set quotationLines to {}
	repeat with quotationBlock in quotationBlocks
		set quotationBlockLines to my regexSplit(quotationBlock, "[\\r\\n]+")
		set quotationBlockLines to (my itemsFromList:(quotationBlockLines as list) withPrefix:"> " negateResults:false)
		if quotationBlockLines is not {} then copy quotationBlockLines to end of quotationLines
	end repeat
	
	return quotationLines
end quotationLinesFromKeypointsNote

-- Returns a list of all metadata lines (i.e., lines prefixed with `< `) from the given note.
on metadataLinesFromKeypointsNote(aNote)
	if aNote is missing value or aNote is "" then return {}
	
	set metadataLines to {}
	
	set metadata to my regexReplace(aNote, "(?<=^|[\\r\\n])(?!< ).+", "") -- remove all non-empty lines that are not metadata lines
	set metadataLines to (my removeEmptyStringsFromList:(paragraphs of metadata)) -- removes empty lines
	
	return metadataLines
end metadataLinesFromKeypointsNote

-- Returns lists of Keypoints-style custom attributes & tags that could be extracted from
-- the given note.
-- Custom attributes & tags must be contained in one or more Keypoints-style metadata
-- line(s) (i.e., line(s) prefixed with `< `) of the given note text.
-- Tags are formatted like `@tag` and `@another tag`, or in Multimarkdown-style like
-- `[@tag]` and `[@another tag]`.
-- Custom attributes are special tags containing key:value pairs where the key starts with
-- a colon character (like `:key`) and is optionally followed by a value (that's separated
-- from the key by a colon character, like `:key:value`).
-- Custom attributes & tags can both occur on a single or multiple metadata lines, e.g.:
-- `< @tag @another tag @:some key:some value @:flagged`
-- @param aNote Keypoints-style note from which custom attributes & tags shall be extracted.
-- @param ignoredAttributesList List of custom attribute keys that shall not be extracted.
-- Note that the actual return value is a list with two items with the first item being the list of
-- extracted custom attributes (where each is a record like `{attribKey:..., attribValue:...}`)
-- and the second item being the list of extracted (regular) tags:
-- `{customAttributes, tags}`
on customAttributesAndTagsFromKeypointsNote(aNote, ignoredAttributesList)
	if aNote is missing value or aNote is "" then return {{}, {}}
	
	set metadataLines to my metadataLinesFromKeypointsNote(aNote)
	
	set tagRegex to "\\[?@[\\w\\p{P}]+\\]?"
	set tags to {}
	set customAttributes to {}
	
	repeat with metadataLine in metadataLines
		if my regexMatch(metadataLine, tagRegex) is not "" then
			-- remove any chars preceeding or following the tag(s), and remove any rating stars
			set metadataLine to my regexReplace(metadataLine, "^< .*?(?=" & tagRegex & ")", "")
			set metadataLine to my regexReplace(metadataLine, "(\\]? *[*★]+ *)+", "")
			
			-- split on tag delimiters
			set tagsList to my regexSplit(metadataLine, "(\\]? *\\[?@)(?!\\s)|\\]?\\s*$")
			set tagsList to (my removeEmptyStringsFromList:tagsList)
			
			-- extract all custom attributes into a separate list (ignoring any attributes contained in ignoredAttributesList)
			set {customAttributesList, tagsList} to my customAttributesFromTags(tagsList, ignoredAttributesList)
			set customAttributes to (my addItemsFromList:customAttributesList toList:customAttributes)
			set tags to (my addItemsFromList:tagsList toList:tags)
		end if
	end repeat
	
	-- remove any duplicate items (this may also change the sort order of list elements)
	set tags to (my uniqueObjectsInList:tags)
	
	-- filter out any remaining custom attributes (i.e., tags that start with ":")
	set tags to (my itemsFromList:tags withPrefix:":" negateResults:true)
	
	return {customAttributes, tags}
end customAttributesAndTagsFromKeypointsNote

-- Returns a list of Keypoints-style custom attributes that could be extracted from the given list of
-- tags, and also returns a list with the remaining (regular) tags.
-- Custom attributes are key:value pairs where the key starts with a colon character (like `:key`)
-- and is optionally followed by a value (that's separated from the key by a colon character, like
-- `:key:value`). If `:value` is missing then `:true` will be used as a default value.
-- @param tagsList List of tags from which custom attributes shall be extracted.
-- @param ignoredAttributesList List of custom attribute keys that shall not be extracted.
-- Note that the actual return value is a list with two items with the first item being the list of
-- extracted custom attributes (where each is a record like `{attribKey:..., attribValue:...}`)
-- and the second item being the given tags list sans the extracted custom attributes:
-- `{customAttributes, tagsList}`
on customAttributesFromTags(tagsList, ignoredAttributesList)
	set customAttributes to {}
	
	repeat with aTag in tagsList
		if aTag starts with ":" then
			set tagKey to my regexMatch(aTag, "(?<=^:)[^:\\n]+")
			set tagValue to my regexReplace(aTag, "^:[^:\\n]+:([^\\n]+)", "$1")
			
			-- if no value was found, use the default value (`true`)
			if tagValue is equal to (aTag as string) then set tagValue to "true"
			
			if tagKey is not "" and tagKey is not in ignoredAttributesList then
				copy {attribKey:tagKey, attribValue:tagValue} to end of customAttributes
				set tagsList to (my removeItem:aTag inList:tagsList)
			end if
		end if
	end repeat
	
	return {customAttributes, tagsList}
end customAttributesFromTags

-- Returns the given note sans its metadata lines (i.e., lines prefixed with `< `).
-- @param aNote The note whose metadata lines shall be removed.
-- @param trimWhitespace Set to `true` if you want whitespace to be trimmed
-- from both ends of the returned note, otherwise set to `false`.
on keypointsNoteWithoutMetadataLines(aNote, trimWhitespace)
	if aNote is missing value or aNote is "" then return ""
	
	set processedNote to my regexReplace(aNote, "(?<=^|[\\r\\n])< .+([\\r\\n]|$)", "")
	if trimWhitespace is true then set processedNote to my trimWhitespace(processedNote)
	
	return processedNote as text
end keypointsNoteWithoutMetadataLines

-- Returns a Keypoints-style ID that represents the given date
-- @param aDate The date to be represented by the returned Keypoints-style ID.
-- @param centiSeconds A number between 0 and 99 to be used when adding millisecond precision.
-- Specify 0 to add some randomly generated milliseconds to the given date. Any number between
-- 1 and 99 will be appended with 0 to form a fixed number of milliseconds (i.e., 1 -> 010, 99 -> 990).
-- Notes:
-- – The Keypoints ID is based on the given date's date ID (formatted like `yyyyMMddHHmmss`) with
--    added millisecond precision, converted to its reverse & Base32-encoded form (after Crockford)
-- – The millisecond precision helps to prevent collisions on automated ID generation.
-- – The Base32 encoding and adding of separator hyphens helps to keep IDs somewhat shorter but still
--    legible/recognizable. Example: For a date ID like `20240812112216540`, this method will return
--    this Keypoints ID: 041M-D06B-A1XA
-- – See http://www.crockford.com/wrmg/base32.html
on keypointsIDForDate(aDate, centiSeconds)
	set dateID to my keypointsDateIDForDate(aDate, centiSeconds)
	set reversedDateID to reverse of dateID's items as text
	set keypointsID to text -14 thru -1 of ("0000000000000" & my base32EncodeCrockford(reversedDateID))
	
	return keypointsID
end keypointsIDForDate

-- Returns a Keypoints-style date ID that represents the given date with some added milliseconds.
-- Keypoints date IDs are formatted like `yyyyMMddHHmmss...` with `...` replaced by the added milliseconds.
-- @param aDate The date to be represented by the returned Keypoints date ID.
-- @param centiSeconds A number between 0 and 99 to be used when adding millisecond precision. If
-- you specify a number >99 only its last two digits will be used. Specify 0 to add a random increment
-- of 10 (between 010 and 990 milliseconds) to the given date. Any other number will be appended
-- with 0 to form a fixed number of milliseconds (examples: 1 -> 010, 99 -> 990, 123 -> 230).
on keypointsDateIDForDate(aDate, centiSeconds)
	set dateFormatter to current application's NSDateFormatter's alloc()'s init
	
	-- set a fixed locale & time zone as recommended in "NSDateFormatter > Working With Fixed Format Date Representations":
	-- https://developer.apple.com/documentation/foundation/nsdateformatter#2528261
	set dateFormatter's locale to current application's NSLocale's localeWithLocaleIdentifier:"en_US_POSIX"
	set dateFormatter's timeZone to current application's NSTimeZone's timeZoneForSecondsFromGMT:0
	
	-- use a Zettelkasten-style date ID including minutes & seconds
	-- Unicode Technical Standard #35 lists available format patterns:
	-- https://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
	set dateIDFormat to "yyyyMMddHHmmss"
	
	-- add a (randomized or default) value for milliseconds
	if centiSeconds is 0 or centiSeconds is "0" then
		-- NOTE: If we'd used random numbers between 1 and 999, the `base32EncodeCrockford()` method would sometimes return
		--           an encoded string that, when converted back, may be off by 1 (or more) (due to calculation precision errors?).
		--           This issue gets worse since we feed `base32EncodeCrockford()` with a reversed date ID. To avoid this issue, we keep
		--           the last millisecond digit as "0".
		set centiSeconds to (random number from 1 to 99 with seed 0)
	end if
	set milliSec to (text -2 thru -1 of ("0" & centiSeconds)) & "0"
	
	set dateFormatter's dateFormat to dateIDFormat & milliSec
	
	return (dateFormatter's stringFromDate:aDate) as string
end keypointsDateIDForDate

-- Converts the given number using a Base32 encoding described by Crockford
-- See http://www.crockford.com/wrmg/base32.html
-- Notes:
-- – This method supports numbers up to 17 digits and is mainly meant to convert date IDs
--    (as obtained by `keypointsDateIDForDate()` having a format like `yyyyMMddHHmmss` plus milliseconds.
-- – To improve legibility, this method will insert hyphens ("-") as separators every four digits, starting from the end.
--    E.g., a date ID like `20240812112216540` will be encoded as `HZ8-X57Y-M0EW`.
-- – See also the `Crockford.pm` CPAN module by Graham Barr:
--    https://metacpan.org/release/GBARR/Encode-Base32-Crockford-2.112991/view/lib/Encode/Base32/Crockford.pm
--    https://github.com/gbarr/Encode-Base32-Crockford
on base32EncodeCrockford(aNumber)
	-- NOTE: regular digits do not include I, L, O or U (see http://www.crockford.com/wrmg/base32.html)
	set encodeSymbols to {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"}
	set quadruplet to ""
	set dateIDParts to {}
	
	-- Keep dividing by 32. Use the remainders to make the digits of the converted number, right to left;
	-- the quotient goes to the next iteration to be divided again. When the quotient hits zero, i.e. there's
	-- not enough for 32 to be a divisor, the value being divided is the final digit.
	repeat while aNumber is not 0
		if (count of quadruplet) is 4 then
			copy quadruplet to beginning of dateIDParts
			set quadruplet to ""
		end if
		
		set theRemainder to aNumber mod 32
		set aNumber to aNumber div 32
		
		set dateIDPart to item (theRemainder + 1) of encodeSymbols
		set quadruplet to dateIDPart & quadruplet
		
		if aNumber is 0 then
			copy quadruplet to beginning of dateIDParts
		end if
	end repeat
	
	if dateIDParts is not {} then
		set dateID to my mergeTextItems(dateIDParts, "-")
	else
		set dateID to "0"
	end if
	
	return dateID
end base32EncodeCrockford


-- ----------------------------------------------------------------------------


-- AppleScript methods

--- Creates a new folder of the given name at the given folder location (specified as POSIX path),
--- and returns the newly created (or existing) folder's POSIX path.
on createNewFolder(aFolderPOSIXPath, aFolderName)
	set aFolderName to cleanFolderName(aFolderName)
	set containerFolder to POSIX file aFolderPOSIXPath as alias
	tell application "Finder"
		set newFolderPath to (folder containerFolder as string) & aFolderName
		if not (exists folder newFolderPath) then
			set newFolderPath to (make new folder at folder containerFolder with properties {name:aFolderName}) as string
		end if
		return POSIX path of (alias newFolderPath)
	end tell
end createNewFolder

-- Removes unwanted or disallowed characters from a string that's to be used as a folder name
on cleanFolderName(aFolderName)
	set aFolderName to my textReplace(aFolderName, ":", " - ")
	set aFolderName to my textReplace(aFolderName, "/", " - ")
	set aFolderName to my textReplace(aFolderName, "  ", " ") -- removes double whitespace (a regex replace would be better)
	return aFolderName
end cleanFolderName

-- Deletes all items contained in the given folder. Use with care.
on deleteFolderContents(folderAlias)
	tell application "Finder"
		set folderContents to items of folderAlias
		if folderContents is not {} then
			delete folderContents
		end if
	end tell
end deleteFolderContents

-- Returns `true` if the file (or folder) at the given POSIX path exists, otherwise returns `false`.
on fileExistsAtFilePath(aFilePOSIXPath)
	if aFilePOSIXPath is missing value or aFilePOSIXPath is "" then return false
	set aFilePOSIXPath to my expandAbbreviatedFilePath(aFilePOSIXPath)
	set theFile to POSIX file aFilePOSIXPath
	tell application "Finder"
		set fileExists to (exists theFile)
	end tell
	return fileExists
end fileExistsAtFilePath

-- If the given file path has an abbreviated form (i.e., it starts with a tilde character indicating
-- the user's home directory, e.g. "~/Downloads"), transforms the path into a full file path and
-- returns it. Otherwise, the given path is returned unchanged.
-- @param aFilePOSIXPath POSIX file path in full or abbreviated form.
on expandAbbreviatedFilePath(aFilePOSIXPath)
	if aFilePOSIXPath starts with "~/" then set aFilePOSIXPath to (POSIX path of (path to home folder)) & characters 3 thru -1 of aFilePOSIXPath
	return aFilePOSIXPath
end expandAbbreviatedFilePath

-- Returns the file name of the file at the given POSIX file path. The file at the given path must exist.
on fileNameFromFilePath(aFilePOSIXPath)
	set aFile to (POSIX file aFilePOSIXPath) as alias
	set fileName to missing value
	tell application "Finder"
		if exists (aFile as string) then
			set fileName to name of aFile
		end if
	end tell
	return fileName
end fileNameFromFilePath

--- Saves a text file to the given file. Note that this will replace any existing file content.
on writeTextToFile(aFile, theText)
	set aFileRef to open for access aFile with write permission
	set eof aFileRef to 0
	write theText to aFileRef as «class utf8»
	close access aFileRef
end writeTextToFile

--- Reads the contents from the given file.
on readFromFile(aFile)
	set aFileRef to open for access aFile without write permission
	set fileContents to read aFileRef as «class utf8»
	close access aFileRef
	return fileContents
end readFromFile

-- Generates a unique file path (which doesn't yet exist on disk) from a given file path.
on uniquifyFilePath(filePath)
	set i to 0
	set done to false
	tell application "Finder"
		set newFilePath to filePath
		repeat until done is true
			if exists newFilePath then
				set i to i + 1
				set fileExtension to name extension of (filePath as alias)
				set newFilePath to my regexReplace(filePath, "\\." & fileExtension & "$", "-" & i & "." & fileExtension)
			else
				set done to true
			end if
		end repeat
	end tell
	return newFilePath
end uniquifyFilePath

-- Merges the given list of text items using the given separator string.
on mergeTextItems(textItemList, aSeparator)
	considering case
		set prevTIDs to text item delimiters of AppleScript
		set text item delimiters of AppleScript to aSeparator
		set mergedText to textItemList as text
		set text item delimiters of AppleScript to prevTIDs
	end considering
	return mergedText
end mergeTextItems

-- Displays given message as a notification. Any of the parameters
-- may be empty.
on displayNotification(theMessage, theTitle, theSubtitle)
	if theMessage is missing value then set theMessage to ""
	
	if theTitle is not missing value and theTitle is not "" then
		if theSubtitle is not missing value and theSubtitle is not "" then
			display notification theMessage with title theTitle subtitle theSubtitle
		else
			display notification theMessage with title theTitle
		end if
	else
		if theSubtitle is not missing value and theSubtitle is not "" then
			display notification theMessage subtitle theSubtitle
		else
			display notification theMessage
		end if
	end if
end displayNotification

-- Displays a message alert.
on displayMessage(theMessage, theDetails, isWarning, dismissAfter)
	-- NOTE: opposed to "critical", the alert types "warning" & "informational" don't seem to influence the dialog icon
	set alertType to informational
	if isWarning is true then set alertType to warning
	
	if dismissAfter > 0 then
		display alert theMessage message theDetails as alertType buttons {"OK"} default button "OK" giving up after dismissAfter
	else
		display alert theMessage message theDetails as alertType buttons {"OK"} default button "OK"
	end if
end displayMessage

-- Displays an error alert.
on displayError(errorMessage, errorDetails, dismissAfter, cancelScriptExecution)
	display alert errorMessage message errorDetails as critical buttons {"OK"} default button "OK" giving up after dismissAfter
	if cancelScriptExecution then
		error number -128
	end if
end displayError

-- Initializes progress reporting.
on setupProgress(progressTitle)
	set progress description to progressTitle
	set progress additional description to "Preparing…"
	set progress total steps to -1
end setupProgress

-- Defines the total number of steps for the progress reporting.
on setTotalStepsForProgress(totalSteps)
	set progress total steps to totalSteps
end setTotalStepsForProgress

-- Updates the progress subtitle and number of completed steps for the progress reporting.
on updateProgress(completedSteps, progressSubtitle)
	set progress additional description to progressSubtitle
	set progress completed steps to completedSteps
end updateProgress

-- Writes the given message to the system's console log.
-- @param loggerName The name of the logging script or process (which will be printed in front of the log message)
-- @param logMessage The log message which shall be written to the system's console log
on logToSystemConsole(loggerName, logMessage)
	if logMessage is missing value or logMessage is "" then return
	set loggerName to "AppleScript: " & loggerName
	do shell script "logger -t \"" & loggerName & "\" " & quoted form of logMessage
end logToSystemConsole

-- Sets the system's clipboard to the given string.
on setClipboard(theString)
	if class of theString is not string then return
	if theString is missing value then return
	
	do shell script "echo " & quoted form of theString & " | pbcopy"
end setClipboard

-- Triggers a paste of the current clipboard content in the frontmost application.
on pasteIntoFrontApp()
	tell application id "sevs"
		set frontAppID to id of first process whose frontmost is true
		tell application id frontAppID
			keystroke "v" using command down
		end tell
	end tell
end pasteIntoFrontApp

-- Flattens a nested list and returns it
-- Credits: modified after script code by users bmose, Nigel_Garvey & robertfern @ macscripter.net (see https://www.macscripter.net/t/flattening-a-list-of-nested-sublists/72172)
on flattenList(theList) -- non-recursive
	script util
		property flattenedList : theList
		property interimFlattenedList : missing value
	end script
	repeat while (count util's flattenedList's lists) > 0
		set util's interimFlattenedList to {}
		repeat with currItem in util's flattenedList
			if (class of currItem) = list then
				set util's interimFlattenedList to util's interimFlattenedList & currItem's contents
			else
				set end of util's interimFlattenedList to currItem's contents
			end if
		end repeat
		set util's flattenedList to util's interimFlattenedList
	end repeat
	return util's flattenedList -- "as list" assures that the return value is dereferenced
end flattenList


-- ----------------------------------------------------------------------------


-- ONLINE SOURCES

-- Returns `true` if the URL (given as a string) is available, otherwise returns `false`.
-- Credits: modified after script code by Vincent @ macscripter.net (see https://www.macscripter.net/t/detect-internet-connection/38005/8)
on isURLAvailable(theURL)
	if theURL is missing value or theURL is "" then return false
	try
		set theURL to theURL as URL
		
		-- this will return the IP address if there is a live connection, otherwise cause an error
		set dotted to dotted decimal form of host of theURL
		
		return true
	on error
		return false
	end try
end isURLAvailable

-- Returns `true` if the given server domain is available, otherwise returns `false`.
-- Note that the request may take a second or so.
on isServerAvailable(domain)
	if domain is missing value or domain is "" then return false
	try
		do shell script "ping -c 1 " & domain
	on error
		return false
	end try
	
	return true
end isServerAvailable

-- Fetches & returns a formatted citation for the given DOI from CrossRef. Returns an empty string in case
-- of error. Note that the CrossRef API request may take a few seconds.
-- @param doi The digital object identifier whose citation shall be fetched
-- @param styleName The name of the citation style file as obtained from https://www.zotero.org/styles,
-- e.g.: apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,
-- modern-language-association, vancouver-author-date
-- @param locale The locale code that specifies which localization data (term translations, localized date
-- formats, and grammar options) shall be used when generating a formatted citation. Examples:
-- en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN
on formattedCitationForDOI(doi, styleName, locale)
	if doi is missing value or doi is "" then return ""
	
	set doiURL to "https://doi.org/" & doi
	if (my isURLAvailable(doiURL)) is false then return ""
	
	if styleName is missing value or styleName is "" then set styleName to "apa"
	if locale is missing value or locale is "" then set locale to "en-US"
	
	set shellCommand to "curl -L -H 'Accept: text/x-bibliography; style=" & styleName & "; locale=" & locale & "' " & doiURL
	set theResult to do shell script shellCommand
	
	if theResult contains "<title>Error:" then return "" -- TODO: extract & return or log error message
	return theResult
end formattedCitationForDOI

-- Fetches & returns BibTeX data for the given DOI from CrossRef. Returns an empty string in case of
-- error. Note that the CrossRef API request may take a second or so.
-- @param doi The digital object identifier whose BibTeX data shall be fetched
on bibTeXForDOI(doi)
	if doi is missing value or doi is "" then return ""
	
	set bibTeXURL to "http://api.crossref.org/works/" & doi & "/transform/application/x-bibtex"
	if (my isURLAvailable(bibTeXURL)) is false then return ""
	
	set theNSURL to current application's NSURL's URLWithString:bibTeXURL
	set bibTeXData to current application's NSData's dataWithContentsOfURL:theNSURL
	
	if bibTeXData is not missing value then
		set bibTeXString to current application's NSString's alloc()'s initWithData:bibTeXData encoding:(current application's NSUTF8StringEncoding)
		
		-- clean BibTeX data (trim, and ensure that BibTeX fields start on a new line)
		set bibTeXString to my regexReplace(bibTeXString as string, "^\\s+|\\s+$", "")
		set bibTeXString to my regexReplace(bibTeXString, ", (?=\\w+=)", "," & linefeed)
		
		return bibTeXString
	end if
	
	return ""
end bibTeXForDOI

-- Fetches & returns a record of bibliographic metadata for the given DOI from OpenAlex.org.
-- @param fetchBibTeX Set to `true` if you also want to fetch BibTeX data for the given DOI from
-- CrossRef.org, else set to `false`. Note that this will cause an extra online request which may
-- take a second or so.
-- @param fetchFormattedCitation Set to `true` if you also want to fetch a formatted citation for
-- the given DOI from CrossRef.org, else set to `false`. Note that this will cause an extra online
-- request which may take a few seconds.
-- @param styleName The name of the citation style file as obtained from https://www.zotero.org/styles,
-- e.g.: apa (default), apa-6th-edition, chicago-author-date, elsevier-harvard, springer-basic-author-date,
-- modern-language-association, vancouver-author-date
-- @param locale The locale code that specifies which localization data (term translations, localized date
-- formats, and grammar options) shall be used when generating a formatted citation. Examples:
-- en-US (default), en-GB, fr-FR, es-ES, de-DE, ru-RU, zh-CN
-- @param citekey The citekey to be used with the fetched BibTeX data; may be empty in which case
-- a default citekey will be used.
on metadataForDOI(doi, fetchBibTeX, fetchFormattedCitation, styleName, locale, citekey)
	set doiURL to "https://doi.org/" & doi
	set openalexURL to "https://api.openalex.org/works/" & doiURL
	if (my isURLAvailable(openalexURL)) is false then return {}
	
	set bibRecord to {doi:doi}
	
	-- citation
	if fetchFormattedCitation is true then
		set bibCitation to my formattedCitationForDOI(doi, styleName, locale)
		if bibCitation is not "" then set bibRecord to bibRecord & {citation:bibCitation}
	end if
	
	-- bibtex
	if fetchBibTeX is true then
		set bibTeXString to my bibTeXForDOI(doi)
		if bibTeXString is not "" then
			-- if available, use the given citekey with the BibTeX data
			if citekey is not missing value and citekey is not "" then
				set bibTeXString to my regexReplace(bibTeXString, "^(@\\w+\\{)([^,\\r\\n]+)", "$1" & citekey)
			end if
			
			set bibRecord to bibRecord & {bibtex:bibTeXString}
		end if
	end if
	
	-- get bibliographic metadata from OpenAlex.org API as JSON
	set theNSURL to current application's NSURL's URLWithString:openalexURL
	set jsonData to current application's NSData's dataWithContentsOfURL:theNSURL
	set jsonArray to (current application's NSJSONSerialization's JSONObjectWithData:jsonData options:0 |error|:(missing value))
	
	-- authors
	set bibAuthors to jsonArray's valueForKey:"authorships"
	if bibAuthors is not missing value and bibAuthors is not {} then
		set bibAuthorNames to bibAuthors's valueForKeyPath:"author.display_name"
		if bibAuthorNames is not missing value and bibAuthorNames is not {} then set bibRecord to bibRecord & {authors:bibAuthorNames as list}
	end if
	
	-- title
	set bibTitle to jsonArray's valueForKey:"title"
	if bibTitle is not missing value and bibTitle is not (current application's NSNull's |null|) then
		set bibRecord to bibRecord & {title:bibTitle as string}
	end if
	
	-- date
	set bibDateString to jsonArray's valueForKey:"publication_date"
	if bibDateString is not missing value and bibDateString is not (current application's NSNull's |null|) then
		set bibDate to current date
		set day of bibDate to (my regexMatch(bibDateString as string, "(?<=^\\d{4}-\\d{2}-)\\d{2}"))
		set month of bibDate to (my regexMatch(bibDateString as string, "(?<=^\\d{4}-)\\d{2}(?=-\\d{2})"))
		set year of bibDate to (my regexMatch(bibDateString as string, "^\\d{4}(?=-\\d{2}-\\d{2})"))
		set hours of bibDate to 0
		set minutes of bibDate to 0
		set seconds of bibDate to 0
		set bibRecord to bibRecord & {|date|:bibDate, dateString:bibDateString as string, year:(year of bibDate as string)}
	end if
	
	-- pmid & pmcid
	set bibIDs to jsonArray's valueForKey:"ids"
	if bibIDs is not missing value and bibIDs is not {} then
		set pmid to bibIDs's valueForKey:"pmid"
		if pmid is not missing value and pmid is not (current application's NSNull's |null|) then
			set pmid to my regexMatch(pmid as string, "(?<=https://pubmed.ncbi.nlm.nih.gov/)\\d+$")
			if pmid is not "" then set bibRecord to bibRecord & {pmid:pmid}
		end if
		
		set pmcid to bibIDs's valueForKey:"pmcid"
		if pmcid is not missing value and pmcid is not (current application's NSNull's |null|) then
			set pmcid to my regexMatch(pmcid as string, "PMC\\d+")
			if pmcid is not "" then set bibRecord to bibRecord & {pmcid:pmcid}
		end if
	end if
	
	-- journal, issn, publisher, URL & PDF URL
	set bibLocation to jsonArray's valueForKey:"primary_location"
	if bibLocation is not missing value and bibLocation is not {} then
		set bibURL to bibLocation's valueForKey:"landing_page_url"
		if bibURL is not missing value and bibURL is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {|url|:bibURL as string}
		
		set bibPDFURL to bibLocation's valueForKey:"pdf_url"
		if bibPDFURL is not missing value and bibPDFURL is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {pdfurl:bibPDFURL as string}
		
		set bibSource to bibLocation's valueForKey:"source"
		if bibSource is not missing value and bibSource is not {} then
			set bibSourceName to bibSource's valueForKey:"display_name"
			if bibSourceName is not missing value and bibSourceName is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {journal:bibSourceName as string}
			
			set bibSourceISSN to bibSource's valueForKey:"issn_l"
			if bibSourceISSN is not missing value and bibSourceISSN is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {issn:bibSourceISSN as string}
			
			set bibSourceHostName to bibSource's valueForKey:"host_organization_name"
			if bibSourceHostName is not missing value and bibSourceHostName is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {publisher:bibSourceHostName as string}
		end if
	end if
	
	-- volume, issue & page
	set bibBiblio to jsonArray's valueForKey:"biblio"
	if bibBiblio is not missing value and bibBiblio is not {} then
		set bibVolume to bibBiblio's valueForKey:"volume"
		if bibVolume is not missing value and bibVolume is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {volume:bibVolume as string}
		
		set bibIssue to bibBiblio's valueForKey:"issue"
		if bibIssue is not missing value and bibIssue is not (current application's NSNull's |null|) then set bibRecord to bibRecord & {issue:bibIssue as string}
		
		set pageRange to {}
		set {bibFirstPage, bibLastPage} to {bibBiblio's valueForKey:"first_page", bibBiblio's valueForKey:"last_page"}
		if bibFirstPage is not missing value and bibFirstPage is not (current application's NSNull's |null|) then copy (bibFirstPage) as string to end of pageRange
		if bibLastPage is not missing value and bibLastPage is not (current application's NSNull's |null|) and bibLastPage ≠ bibFirstPage then copy (bibLastPage) as string to end of pageRange
		if pageRange is not {} then set bibRecord to bibRecord & {page:(my mergeTextItems(pageRange, "-"))}
	end if
	
	-- type
	set bibType to jsonArray's valueForKey:"type" -- OpenAlex type
	if bibType is not missing value and bibType is not (current application's NSNull's |null|) then
		set bibRecord to bibRecord & {|type|:bibType as string}
	end if
	
	set bibTypeCrossRef to jsonArray's valueForKey:"type_crossref" -- CrossRef type / OpenAlex legacy type
	if bibTypeCrossRef is not missing value and bibTypeCrossRef is not (current application's NSNull's |null|) then
		set bibRecord to bibRecord & {type2:bibTypeCrossRef as string}
	end if
	
	-- keywords
	set bibKeywords to jsonArray's valueForKey:"keywords"
	if bibKeywords is not missing value and bibKeywords is not {} then
		set bibKeywordNames to bibKeywords's valueForKey:"display_name"
		if bibKeywordNames is not missing value and bibKeywordNames is not {} then set bibRecord to bibRecord & {tags:bibKeywordNames as list}
	end if
	
	return bibRecord
end metadataForDOI
