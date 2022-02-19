# bashrcd

A lightweight organizational scheme for .bashrc files. Instead of piling all your modifications into a single _.bashrc_ file, split them into scripts that are sourced.

## How to use

Pick a directory where your sourced scripts will live. A typical location is _$HOME/.bashrc.d_, but any directory is fine. Create the directory if it doesn't exist.

Add the contents of [main.sh](main.sh) to your existing _.bashrc_ file - near the end is usually a good spot - and modify the directory in the `find` command to point to your chosen directory. At this point, any new shell processes will use the added code, but there's nothing to source yet.

The remaining work is to move exports, aliases, functions, and other commands out of your main _.bashrc_ and into new script files that will be sourced instead. Let's call them ".bashrc.d files", even if you aren't using a ".bashrc.d" directory.

When creating a new .bashrc.d file, name it following this pattern:

_&lt;digits>.&lt;key>.sh_

* The digits determine the order in which the files are sourced.
* Pick a unique value name for the key portion of each file name.

One scheme is to use three-digit numbers for the digits portion, e.g.: _100.basics.sh_, _234.python.sh_, _999.final_stuff.sh_.

Fill in the body of each .bashrc.d file with the commands you want. Since they are all sourced, one file can depend on exported variables, functions, and aliases defined in a file that is sourced before it.

## Tips

Take your time populating .bashrc.d files. The main script doesn't expect everything to be moved there at once, if ever.

The `bashrcd` associative array remembers which scripts have run, by their keys. This prevents scripts from accidentally being sourced multiple times. Use the array to know what's already been sourced.

If you want to disable a .bashrc.d file, then set its key equal to 1 before it is sourced, for example, in _$HOME/.bashrc_.

Because `bashrcd` is an associative array, you need to use bash 4 or higher. On macOS, swap in Homebrew's bash distribution:

```
brew install bash
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## License

[Unlicense](UNLICENSE)
