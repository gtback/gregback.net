Title: Building Git from scratch
Date: 2013-02-03 00:17
Author: Greg Back
Category: Linux
Tags: git, Linux, ubuntu

This is running on Ubuntu 12.04, using the most recent versions as of
2013-02-02.

Install git:

    :::console
    $ wget http://git-core.googlecode.com/files/git-1.8.1.2.tar.gz
    $ tar xf git-1.8.1.2.tar.gz
    $ cd git-1.8.1.2/
    $ sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev
    $ make prefix=/usr/local all
    $ sudo make prefix=/usr/local install


Install the manpages:

    :::console
    $ wget http://git-core.googlecode.com/files/git-manpages-1.8.1.2.tar.gz
    $ sudo tar xf git-manpages-1.8.1.2.tar.gz -C /usr/local/man


