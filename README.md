# Cuis-Smalltalk-AskLinux
Repository of helper methods to query Linux services

# Overview 
* This is a collection of methods to get some information straight from Linux.
* The methods are grouped in the two Classes **LinuxFFI**, and **LinuxShell**. When a method exists in more classes the FFI version will be faster but the Shell version will be easier to check and will never crash your Smalltalk.
* **Philosophical**. The most laborious thing in *Smalltalk* isn't to run a shell command, it is to **parse** its output and make it look like a decent data structure (an Object). In other programming languages as Shells(s) and *Perl* you don't need this step, you split text lines into fields and access them through a numerical index. This way of doing is possible in *Smalltalk* as well but it would be a violence to the language.

## List of methods currently implemented 
* Abbreviations: **[S]** (implemented as Shell command), **[F]** (implemented as FFI command), **[R]** (requires *root* priviledges, it will be called via *sudo*).
* **date**. [S]. Returns the current Linux date as a `DateAndTime` object.
* **epoch**. [SF]. Returns the number of seconds since the Unix epoch as a Smalltalk Integer.
* **time**. [S]. Returns the current Linux time as a `Time` ibject. 

## List of topics I wish to cover 
* **df**. Available disk space 
* **lsof**. Status of open files
* **mem**. Available system memory 
* **stat**. Se a file property
* **top**. System load 
* **ip a**. Status of network interface.  
* **route**. Status of routing table 
* 
* 

 
