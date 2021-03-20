Title: Rebase warning when running `brew update`
Date: 2021-03-19 23:03
Modified: 2021-03-19 23:03
Category: macOS
Tags: Homebrew
Slug: brew-update-rebase-warning
Authors: Greg Back
Summary: What to do when Homebrew warns that you're in the middle of a rebase.

If you run `brew update` and see output that looks like this:

```text
fatal: It seems that there is already a rebase-merge directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
        git rebase (--continue | --abort | --skip)
If that is not the case, please
        rm -fr ".git/rebase-merge"
and run me again.  I am stopping in case you still have something
valuable there.

Already up-to-date.
```

You can fix it by running `brew update-reset`.

This happened to me today and I spent way too long looking for the solution.

[Source: [GitHub comment][] by **[@joshuapinter][pinter]**]

[github comment]: https://github.com/Homebrew/brew/issues/6288#issuecomment-550411122
[pinter]: https://github.com/joshuapinter
