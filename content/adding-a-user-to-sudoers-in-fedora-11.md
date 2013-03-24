Title: Adding a User to Sudoers in Fedora 11
Date: 2009-12-12 14:21
Author: Greg Back
Category: Linux
Tags: commandline, fedora

The following shows how to add a user to the "sudoers" file in Fedora 11
(and likely other versions of Fedora), allowing normal users to execute
elevated commands with `sudo ...` instead of needing to switch to root
(`su -`).

    :::console
    [greg@fedora ~]$ su -
    [root@fedora ~]# chmod +w /etc/sudoers
    [root@fedora ~]# echo 'greg ALL=(ALL) ALL' >> /etc/sudoers
    [root@fedora ~]# chmod -w /etc/sudoers
    [root@fedora ~]# exit

</p>
