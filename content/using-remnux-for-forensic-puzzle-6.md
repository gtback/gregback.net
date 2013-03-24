Title: Using REMnux for Forensic Puzzle #6
Date: 2011-03-17 23:00
Author: Greg Back
Category: Security
Tags: Linux, perl, python, remnux

I thought it would be interesting to use Lenny Zeltser's excellent
[REMnux distribution][] to solve [this puzzle][]posted by ForensicKB.
I'll admit that I saw [the solution][] before solving it, but since I
don't have a copy of EnCase lying around, I wanted to use some free
tools to accomplish the same thing.

### Getting REMnux

Follow the instructions at the link above to get REMnux as a LiveCD or
VMware-compatible virtual machine. Once you get it up and running
(either just the console or the XFCE interface), we can get going...

### Getting set up

Download the file into a new directory and unzip it.

    :::console
    remnux@remnux: ~$ mkdir Forensic Challenge6
    remnux@remnux: ~$ cd ForensicChallenge6
    remnux@remnux: ~/ForensicChallenge6$ wget http://www.lancemueller.com/blog/evidence/Suspicious_File.zip
    remnux@remnux: ~/ForensicChallenge6$ unzip Suspicious_File.zip

### Initial Steps

Just for fun, we can run "xorsearch" to see if we have an executable by
looking for the string "This program cannot be run in DOS mode", a
standard feature in Windows executables.

    :::console
    remnux@remnux: ~/ForensicChallenge6$ xorsearch Suspicious_File "This program"
    Found XOR 6A position 0A4E: This program cannot be run in DOS mode....$

It's much later than we expected in the file, though (HINT: it's
typically in the first 0x100 bytes.)

We'll use the "file" command along with the useful TrID to determine
what type of we have.

    :::console
    remnux@remnux: ~/ForensicChallenge6$ file Suspicious_File
    Suspicious_File: CDF V2 Document, corrupt: Cannot read summary info
    remnux@remnux: ~/ForensicChallenge6$ trid Suspicious_File
    TrID/32 - File Identifier v2.00/Linux - (C) 2003-06 By M.Pontello
    Definitions found:  3887
    Analyzing...

    Collecting data from file: Suspicious_File
    100.0% (.) Generic OLE2 / Multistream Compound File (8000/1)

Looks like an OLE2 Compound Binary File. I didn't want to write my own
parser, so I started looking for a good command line one and found a
[good python script][]to do it for me.

    :::console
    remnux@remnux: ~/ForensicChallenge6$ wget http://www.decalage.info/files/OleFileIO_PL-0.21.zip
    remnux@remnux: ~/ForensicChallenge6$ unzip OleFileIO_PL-0.21.zip
    remnux@remnux: ~/ForensicChallenge6$ cd OleFileIO_PL-0.21/
    remnux@remnux: ~/ForensicChallenge6/OleFileIO_PL-0.21$ python
    Python 2.6.4 (r264:75706, Dec  7 2009, 18:45:15)
    [GCC 4.4.1] on linux2
    Type "help", "copyright", "credits" or "license" for more information.

A quick python interpreter session extracted the files from this
compound file format.

    :::pycon
    >>> import OleFileIO_PL
    >>> assert OleFileIO_PL.isOleFile('../Suspicious_File')
    >>> ole = OleFileIO_PL.OleFileIO('../Suspicious_File')
    >>> print ole.listdir()
    [['Details'], ['File_0']]
    >>> f = open('../Details','w')
    >>> f.write(ole.openstream('Details').read())
    >>> f.close()
    >>> f = open('../File_0','w')
    >>> f.write(ole.openstream('File_0').read())
    >>> f.close()
    >>> exit()


Now we have two files to analyze. We can use "xorsearch" again with the
"-s" switch to perform the XOR on the executable file (File\_0) and
write the transformed file to disk.

    :::console
    remnux@remnux: ~/ForensicChallenge6/OleFileIO_PL-0.21$ cd ..
    remnux@remnux: ~/ForensicChallenge6$ xorsearch -s File_0 "This program"Found XOR 6A position 004E: This program cannot be run in DOS mode....$

</p>
To convert the other file, we assume the same XOR key and use Perl to
perform the conversion. I'm by no means a Perl guru, but some Googling
helped a lot. It takes advantage of a lot of Perl's built-in default
operators, to minimize the size of the commad.

    :::console
    remnux@remnux: ~/ForensicChallenge6$ cat Details | perl -e 'while (<STDIN>) { foreach (split //) {print chr(ord ^ 0x6a)}}' > Details.XOR.6A

Now we have the two files, and we can perform the required MD5 hash
calculations, or any other analysis desired (i.e. on the executable).

    :::console
    remnux@remnux: ~/ForensicChallenge6$ md5sum File_0,XOR.6A
    8dc601710e3e68b8d78b5cd73fb28616  File_0.XOR.6A
    remnux@remnux:~/ForensicChallenge6$ md5sum Details.XOR.6A
    f93a7bb8e02a8a23f87dad22b9ecd578  Details.XOR.6A

### Summary

I certainly learned a lot about REMnux, and got to write a bit of code
in the process. Hopefully you learned a thing or two reading this as
well.

### More reading

If you love file specifications as much as I do, you'll love these
documents.

-   \[[MS-CFB][]\] : Microsoft's description of the OLE2 format
-   [PE/COFF][]: Specification of the Windows standard executable file
    format (Portable Executable/Common Object File Format)

</p>

  [REMnux distribution]: http://zeltser.com/remnux/
  [this puzzle]: http://www.forensickb.com/2011/02/forensic-puzzle-6.html
  [the solution]: http://www.forensickb.com/2011/03/answers-to-forensic-puzzle-6.html
  [good python script]: http://www.decalage.info/python/olefileio
  [MS-CFB]: http://msdn.microsoft.com/en-us/library/dd942138%28PROT.13%29.aspx
  [PE/COFF]: http://http://msdn.microsoft.com/en-us/windows/hardware/gg463119
