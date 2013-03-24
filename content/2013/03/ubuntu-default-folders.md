Title: Ubuntu Default Folders
Date: 2013-03-24 00:39
Author: Greg Back
Category: Linux
Tags: Ubuntu, GNOME

I recently switched my primary machine from Windows 7 to Ubuntu. I'd always
used an Ubuntu VM for development. Now I just have a Windows 7 VM for
Windows-only applications, and do the majority of my work in Ubuntu. I'm fairly
comfortable on the command line, but *extremely dislike* capital letters in
file paths. So the Ubuntu defaults ("Documents", "Downloads", etc.) just
weren't doing it for me. Fortunately, I found a [blog post](https://silverwav.wordpress.com/2010/03/21/note-ubuntu-default-folders/) which
explained which file sets these names
(`$HOME/.config/user-dirs.dirs`).

My complete configuration is shown below.

    ::bash
    # This file is written by xdg-user-dirs-update
    # If you want to change or add directories, just edit the line you're
    # interested in. All local changes will be retained on the next run
    # Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
    # homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
    # absolute path. No other format is supported.
    #
    XDG_DESKTOP_DIR="$HOME/desktop"
    XDG_DOWNLOAD_DIR="$HOME/dl"
    XDG_TEMPLATES_DIR="$HOME/templates"
    XDG_PUBLICSHARE_DIR="$HOME/public"
    XDG_DOCUMENTS_DIR="$HOME/docs"
    XDG_MUSIC_DIR="$HOME/music"
    XDG_PICTURES_DIR="$HOME/pics"
    XDG_VIDEOS_DIR="$HOME/videos"
