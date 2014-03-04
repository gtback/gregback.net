Title: Run Wireshark as non-root user
Date: 2014-03-04 11:46
Author: Greg Back
Category: Linux
Tags: Wireshark

I frequently get frustrated when Wireshark won't run as a non-root user due
to permissions on the dumpcap process. Here's the fix:

    ::bash
    sudo groupadd wireshark
    sudo usermod -a -G wireshark $USER
    sudo chgrp wireshark /usr/bin/dumpcap
    sudo chmod 754 /usr/bin/dumpcap
    sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
    exec su -l $USER  # reload groups for user

Alternatively, you can log out and log back in to refresh the groups the user
is in.
