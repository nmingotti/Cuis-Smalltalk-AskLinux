# Cuis-Smalltalk-AskLinux
Repository of helper methods to query Linux services

# Overview 
* This is a collection of methods to get some information straight from Linux.
* The methods are grouped in the two Classes **LinuxFFI**, and **LinuxShell**. When a method exists in more classes the FFI version will be faster but the Shell version will be easier to check and will never crash your Smalltalk.

## List of methods currently implemented 
* Abbreviations: S (implemented as Shell command), F (implemented as FFI command).
* **date**. [S]. Return the current Linux date as a `DateAndTime` object.
* **time**. [S]. Return the current Linux time as a `Time` ibject. 


 
