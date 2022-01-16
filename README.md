# bashrcd

A lightweight organizational scheme for .bashrc files. Instead of piling all your modifications into a single _.bashrc_ file, split them into scripts that are sourced.

## How to use

Pick a directory where your sourced scripts will live. A typical location is _$HOME/.bashrc.d_, but any directory is fine. Create the directory if it doesn't exist.

Add the contents of [main.sh](main.sh) to your existing _.bashrc_ file - near the end is usually a good spot - and modify the directory in the `find` command to point to your chosen directory. At this point, any new shell processes will use the added code, but there's nothing to source yet.

The remaining work is to move exports, aliases, functions, and other commands out of your main _.bashrc_ and into new script files that will be sourced instead. Let's call them ".bashrc.d files", even if you aren't using a ".bashrc.d" directory.

To create a new .bashrc.d file, start with the contents of [skeleton.sh](skeleton.sh). Pick a new value for _key_ that is unique to the script and replace that in the script. Then, fill in the body of the script with the commands you want.

## Tips

Take your time populating .bashrc.d files. The main script doesn't expect everything to be moved there at once, if ever.

The .bashrc.d files are sourced in sort order, so name the files so that they sort in the order you want them to be run. One scheme is to start each one with a three-digit number, such as _100_basics.sh_ or _234_python.sh_ or _999_final_stuff.sh_. The names of the files don't matter otherwise, and the names don't need to match up with the keys that they use.

The `bashrcd` associative array remembers which scripts have run, by their keys. This prevents scripts from accidentally being sourced multiple times. Also, if you want to disable a .bashrc.d file, then set its key equal to 1 before it is sourced.

Because `bashrcd` is an associative array, you need to use bash 4 or higher. On macOS, swap in Homebrew's bash distribution:

```
brew install bash
echo /usr/local/bin/bash | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash
```

## License

[Unlicense](UNLICENSE)
