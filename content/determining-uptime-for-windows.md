Title: Determining Uptime for Windows
Date: 2009-08-14 16:32
Author: Greg Back
Category: Windows
Tags: uptime

After my computer restarted overnight I became curious as to what time
it restarted (I had something running overnight and was upset that it
didn't finish. A quick Google search revealed that there are several
ways to reveal this information:

### Uptime.exe Utility

Microsoft provides a small utility that determines uptime based on
events in the Event Log. If the Event Log has been cleared then this
method will not work. More information and the download link can be
found [here][]. You can copy it into the system directory (i.e.
C:\\WINDOWS) and run it from the command line anywhere or (if you don't
have administrative privileges) save it in any directory and then run it
using the command line from that directory.

### SystemInfo command

Although uptime does not appear in the GUI System Information
(Start-\>Programs-\>Accessories-\>System Tools-\>System Information),
the command line tool "systeminfo" contains a line with the system
uptime.

### Batch Script

The following batch script will use the "systeminfo" command and find
the uptime within the output of that command.

    :::batch
    @echo
    @systeminfo | @find "System Up Time:"
    @echo
    @pause

[Source : [HardForum.com][]]

### Network Connections

If you have a persistent network connection, typically it will start
nearly as soon as the computer does. Therefore you can get a rough
estimate using the information found in Start-\>Settings-\>Network
Connections-\>(Connection Name) under the "Duration:" field.

(The above path is for Windows XP with the Classic Start Menu). Other
versions of Windows have a slightly different path. Usually there is a
"Network Connections" link on the left side of an Explorer Window.
Otherwise there may be an icon representing your network connection in
the system tray. Clicking on either of these should give an option to
bring up the information for that connection.

  [here]: http://support.microsoft.com/kb/q232243/
  [HardForum.com]: http://www.hardforum.com/archive/index.php/t-717665.html
