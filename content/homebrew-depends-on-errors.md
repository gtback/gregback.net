Title: Homebrew `depends_on` errors
Date: 2021-06-26 15:08
Modified: 2021-06-26 15:08
Category: macos
Authors: Greg Back
Summary:

If you're trying to install (or more likely uninstall) an old Homebrew Cask, you might get an error like:

```console
Error: Cask 'spectacle' definition is invalid: invalid 'depends_on macos' value: unknown or unsupported macOS version: :lion
```

To fix this, you can run the following command to "fix" the manifests of all currently-installed Casks:

```sh
/usr/bin/find "$(brew --prefix)/Caskroom/"*'/.metadata' -type f -name '*.rb' -print0 | /usr/bin/xargs -0 /usr/bin/perl -i -pe 's/depends_on macos: \[.*?\]//gsm;s/depends_on macos: .*//g'
```

Source: [Homebrew/homebrew-cask#58046](https://github.com/Homebrew/homebrew-cask/issues/58046)
