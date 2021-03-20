Title: The `date` command
Date: 2021-03-19 22:43
Modified: 2021-03-19 22:43
Category: Linux
Slug: date
Authors: Greg Back
Summary: Common usages for the `date` command

The Linux `date` command can be used to get the current date (and also to modify
the date of your machine, but I've never used it for that). It's useful if you
want to programmatically add a date to a filename, either one time or as part of
a regularly-scheduled or repeated task.

Here are some of the frequently used formats I use:

| Command                          | Sample Output               | Notes                                                                           |
| -------------------------------- | --------------------------- | ------------------------------------------------------------------------------- |
| `date +%F`                       | `2021-03-19`                | If you just need the date                                                       |
| `date +"%F %R"`                  | `2021-03-19 22:43`          | Like the date and time of this post                                             |
| `date +"%Y-%m-%dT%H:%M:%S%z"`    | `2021-03-19T22:43:52-0400`  | [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time in the local time zone. |
| `date -Iseconds`                 | `2021-03-19T22:43:52-04:00` | Same, except including a ":" in the offset (does not work on macOS)             |
| `date -u +"%Y-%m-%dT%H:%M:%S%z"` | `2021-03-20T02:43:52+0000`  | ISO 8601 date in UTC                                                            |
| `date -u +"%Y-%m-%dT%H:%M:%SZ"`  | `2021-03-20T02:43:52Z`      | Same, but using `Z` instead of `+0000`                                          |
| `date -u -Iseconds`              | `2021-03-20T02:51:58+00:00` | Same with colon in the output (does not work on macOS)                          |

For more information, see [this Stack Exchange post][stack-exchange] or the
[`date` man page][man-date] (along with the [`strftime` man page][man-strftime]
for formatting options).

[stack-exchange]: https://unix.stackexchange.com/questions/164826/date-command-iso-8601-option
[man-date]: https://man7.org/linux/man-pages/man1/date.1.html
[man-strftime]: https://man7.org/linux/man-pages/man3/strftime.3.html
