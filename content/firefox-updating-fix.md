Title: Firefox Updating Fix
Date: 2010-02-11 22:59
Author: Greg Back
Category: Windows
Tags: firefox, xp

This is a problem I used to have with Firefox updates failing when I was
running as a Limited User in Windows XP.

Here are the steps to fix the problem:

1.  Close all running instances of Firefox.
2.  Open an Administrator command prompt by right-clicking on a Command
    Prompt icon, choose Run As... and enter the credentials of a user
    with administrator rights.
3.  Launch Process Monitor from the administrator command prompt by
    typing the full path to the executable (wherever you installed it).
    For example: c:\\apps\\procmon.exe (tab completion can be very
    helpful for this step).
4.  Within Process Monitor, turn off "Show Registry Activity" and "Show
    File System Activity" from the toolbar. Only "Show Process and
    Thread Activity should be enabled". This step is not absolutely
    necessary, but it will eliminate a lot of extra noise.
5.  Start Firefox, and click through the "Software Update Failed" dialog
    until the browser opens.
6.  Switch back to Process Monitor and press CTRL-E or the click the
    toolbar button to stop capturing events. Close any Firefox windows
    that might be open.
7.  Scroll through the list of processes and double-click on the first
    instance of "updater.exe" (it should have the value "Process Start"
    in the Operation column). Switch to the Process tab of the Event
    Properties window that opens.
8.  Select the entire contents of the "Command Line:" textbox and copy
    it (CTRL-C or right-click, Copy). It should look something like this
    (all one line): "C:\\Documents and Settings\\Josh\\Local
    Settings\\Application Data\\Mozilla\\Firefox\\Mozilla
    Firefox\\updates\\0\\updater.exe" "C:\\Documents and
    Settings\\Josh\\Local Settings\\Application
    Data\\Mozilla\\Firefox\\Mozilla Firefox\\updates\\0" "3824"
    "C:\\Program Files\\Mozilla Firefox" "C:\\Program Files\\Mozilla
    Firefox\\firefox.exe"
9.  Switch back to the administrator command prompt and right-click,
    Paste to paste the command-line. Press Enter.
10. You should see a dialog indicating that Firefox is updating. Close
    the browser that opens since it is still running as the
    administrator.
11. Now open Firefox normally. It should start up without the annoying
    error message.

Source: [Flimflan.com][]

  [Flimflan.com]: http://flimflan.com/blog/FirefoxErrorResolvedOneOrMoreFilesCouldNotBeUpdated.aspx
