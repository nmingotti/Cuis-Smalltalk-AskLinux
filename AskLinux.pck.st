'From Cuis 5.0 [latest update: #4963] on 11 November 2021 at 8:42:25 am'!
'Description '!
!provides: 'AskLinux' 1 10!
!requires: 'CommandShell' 1 2 nil!
!requires: 'OSProcess' 1 18 nil!
SystemOrganization addCategory: 'AskLinux-CStruct'!
SystemOrganization addCategory: #AskLinux!


!classDefinition: #LinuxFFI category: #AskLinux!
Object subclass: #LinuxFFI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AskLinux'!
!classDefinition: 'LinuxFFI class' category: #AskLinux!
LinuxFFI class
	instanceVariableNames: ''!

!classDefinition: #LinuxShell category: #AskLinux!
Object subclass: #LinuxShell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AskLinux'!
!classDefinition: 'LinuxShell class' category: #AskLinux!
LinuxShell class
	instanceVariableNames: ''!

!classDefinition: #StructCtime_t category: 'AskLinux-CStruct'!
ExternalStructure subclass: #StructCtime_t
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AskLinux-CStruct'!
!classDefinition: 'StructCtime_t class' category: 'AskLinux-CStruct'!
StructCtime_t class
	instanceVariableNames: ''!

!classDefinition: #StructCtm category: 'AskLinux-CStruct'!
ExternalStructure subclass: #StructCtm
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AskLinux-CStruct'!
!classDefinition: 'StructCtm class' category: 'AskLinux-CStruct'!
StructCtm class
	instanceVariableNames: ''!


!StructCtm methodsFor: 'printing' stamp: 'NM 11/6/2021 17:10:50'!
printOn: aStream
	|str|
	str _ ((self class name withArticle) , ' - ', ('H:{1} M:{2} S:{3} ' format: {self tm_hour. self tm_min. self tm_sec} ) ).
	aStream nextPutAll: str.! !

!LinuxFFI class methodsFor: 'tested' stamp: 'NM 11/11/2021 08:29:38'!
epoch
"return the number of seconds from the Unix epoch. Smalltalk Integer. "
	<cdecl: ulong 'time' (void) module:  'libc.so.6' >
	^self externalCallFailed! !

!LinuxFFI class methodsFor: 'to-fix' stamp: 'NM 11/11/2021 08:36:01'!
localtime: anInt
". Should return a 'tm' struct, which here is a 'StructCtm'. 
. According to a mail to cuis-smalltak mailing of 09-nov-2021 from Andres Valloud
  this can not work because localtime might be a macro. 
. Example TO-FIX-CHECK
---------------
 LinixFFI localtime: (LinuxFFI epoch)
---------------
"
	<cdecl: StructCtm* 'localtime' (ulong*) module:  'libc.so.6' >
	^self externalCallFailed! !

!LinuxShell class methodsFor: 'to-fix-or-test' stamp: 'NM 11/7/2021 01:43:03'!
stat: pathString
	". given a correct path string return the result of 
	$> stat 
	"
	^ nil ! !

!LinuxShell class methodsFor: 'tested' stamp: 'NM 11/7/2021 01:52:02'!
date 
	". Return a DateAndTime object which is made according to the 
	result obtained by Linux `$> date`.
	. RATIO. We want to be sure the time takes into account changes due 
	to daylight save time change, Linux does that automatically, Cuis
	`DateAndTime now` at Nov-2021 does not. 
	. In Cuis 'DateAndTime localTimeZone' default to 'UTC'. 
	. The time is red in from Linux as a string without the timezone, in absolute terms,
	in this way it is passed to DateAndTime. 
	"
	|pr cmd out|
	cmd _ 'date +''%Y-%m-%dT%H:%M:%S'' '.
	pr _ PipeableOSProcess waitForCommand: cmd .
	self assert: (pr exitCode = 0).
	out _ pr output. 
	^ DateAndTime fromString: out! !

!LinuxShell class methodsFor: 'tested' stamp: 'NM 11/10/2021 16:17:19'!
time 
	". Return a Time object which is made according to the 
	result obtained by Linux `$> date`.
	. RATIO. We want to be sure the time takes into account changes due 
	to daylight save time change, Linux does that automatically, Cuis
	`DateAndTime now` at Nov-2021 does not. 
	. In Cuis 'DateAndTime localTimeZone' default to 'UTC'. 
	. The time is red in from Linux as a string without the timezone, in absolute terms,
	in this way it is passed to DateAndTime. 
	"
	|pr cmd out|
	cmd _ 'date +''%H:%M:%S'' '.
	pr _ PipeableOSProcess waitForCommand: cmd .
	self assert: (pr exitCode = 0).
	out _ pr output. 
	^ Time fromString: out! !

!StructCtm methodsFor: 'accessing'!
tm_hour
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 9! !

!StructCtm methodsFor: 'accessing'!
tm_hour: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 9 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_isdst
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 33! !

!StructCtm methodsFor: 'accessing'!
tm_isdst: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 33 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_mday
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 13! !

!StructCtm methodsFor: 'accessing'!
tm_mday: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 13 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_min
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 5! !

!StructCtm methodsFor: 'accessing'!
tm_min: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 5 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_mon
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 17! !

!StructCtm methodsFor: 'accessing'!
tm_mon: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 17 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_sec
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 1! !

!StructCtm methodsFor: 'accessing'!
tm_sec: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 1 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_wday
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 25! !

!StructCtm methodsFor: 'accessing'!
tm_wday: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 25 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_yday
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 29! !

!StructCtm methodsFor: 'accessing'!
tm_yday: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 29 put: anObject! !

!StructCtm methodsFor: 'accessing'!
tm_year
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	^handle signedLongAt: 21! !

!StructCtm methodsFor: 'accessing'!
tm_year: anObject
	"This method was automatically generated. See StructCtm class>>fields."
	<generated>
	handle signedLongAt: 21 put: anObject! !

!StructCtm class methodsFor: 'as yet unclassified' stamp: 'NM 11/6/2021 16:17:00'!
fields
	"FFI defineFields"
	^#(
		(tm_sec 	'long')
		(tm_min 	'long')
	       (tm_hour 	'long')
		(tm_mday 	'long')
		(tm_mon 	'long')
		(tm_year 	'long')
		(tm_wday 	'long')
		(tm_yday 	'long')
		(tm_isdst 	'long')
	)! !

!StructCtm class methodsFor: 'as yet unclassified' stamp: 'NM 11/6/2021 15:18:15'!
initialize
	self compileFields! !
StructCtm initialize!
