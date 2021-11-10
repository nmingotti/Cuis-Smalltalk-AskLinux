'From Cuis 5.0 [latest update: #4908] on 10 November 2021 at 4:37:19 pm'!
'Description '!
!provides: 'AskLinux' 1 6!
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


!LinuxShell class methodsFor: 'as yet unclassified' stamp: 'NM 11/7/2021 01:52:02'!
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

!LinuxShell class methodsFor: 'as yet unclassified' stamp: 'NM 11/7/2021 01:43:03'!
stat: pathString
	". given a correct path string return the result of 
	$> stat 
	"
	^ nil ! !

!LinuxShell class methodsFor: 'as yet unclassified' stamp: 'NM 11/10/2021 16:17:19'!
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
