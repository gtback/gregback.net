Title: Exploring Sqlite databases
Date: 2021-03-28 23:15
Modified: 2021-03-28 23:15
Category: Linux
Slug: sqlite
Authors: Greg Back
Tags: sqlite, cli
Summary: Some common commands for exploring sqlite databases

It's often useful to peek around a sqlite database file from the command line,
especially those that applications use for storing their own internal data. In
this case, I was interested in looking at how Firefox stores a user's browsing history (which happens to be in the file called `places.sqlite` inside the Firefox profile directory). Anyway, here are some commands you can run:

```sh
$ sqlite places.sqlite
sqlite> .help
sqlite> .tables
sqlite> .dbinfo
sqlite> PRAGMA table_info(moz_places)
sqlite> .quit
```

`moz_places` is the name of the specific table I was interested in.
