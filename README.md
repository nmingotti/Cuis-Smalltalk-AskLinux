# Cuis-Smalltalk-AskLinux
Repository of helper methods to query Linux services

# Overview 
* This is a collection of methods to get some information straight from Linux.
* The methods are grouped in the two Classes **LinuxFFI**, and **LinuxShell**. When a method exists in more classes the FFI version will be faster but the Shell version will be easier to check and will never crash your Smalltalk.

## List of methods currently implemented 
* Abbreviations: S (implemented as Shell command), F (implemented as FFI command).
* **date**. [S]. Returns the current Linux date as a `DateAndTime` object.
* **epoch**. [SF]. Returns the number of seconds since the Unix epoch as a Smalltalk Integer.
* **time**. [S]. Returns the current Linux time as a `Time` ibject. 

## List of topics I wish to cover 
* **stat**. Se a file property
* **lsof**. Status of open files, 
* *network*. Status of network connections 
* **df**. Available disk space 
* **mem**. Available system memory 
* **top**. System load 

 
