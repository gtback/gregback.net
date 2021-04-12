Title: The `-o` option to `grep`
Date: 2021-04-11 19:18
Modified: 2021-04-11 19:18
Category: linux
Authors: Greg Back

I don't know how I made it this long in my technical career without knowing about the `-o` option to `grep`, which prints only the part of the line that matches the regular expression, not the entire line. I have spent way too much time post-processing the results with `sed`, `awk`, etc. (and learned a lot in the process), but hopefully this will save me (and you) some time in the future.

Source: [`grep`(1) man page](https://www.man7.org/linux/man-pages/man1/grep.1.h)
