Title: How to Compress or Decompress .tar.gz (or .tgz) files
Date: 2009-10-17 13:47
Author: Greg Back
Category: Linux
Tags: gz, tar

To compress a folder of files into a single tar-zip file, use the
command:

    :::bash
    tar -czvf archive.tgz files/

To extract a tar-zip file into the current directory, use the command:

    :::bash
    tar -xzvf archive.tgz

