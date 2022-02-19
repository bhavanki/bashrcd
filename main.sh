#!/usr/bin/env bash

# Add this to $HOME/.bashrc

# Requires bash 4+
# On macOS:
#   brew install bash
#   echo /usr/local/bin/bash | sudo tee -a /etc/shells
#   chsh -s /usr/local/bin/bash
# shellcheck disable=SC2034
declare -A bashrcd

# Scripts to skip
#bashrcd[x]=1
#bashrcd[y]=1

#echo -n ".bashrc.d ..."
for f in $(find "$HOME/.bashrc.d" -maxdepth 1 -name '*.sh' | sort); do
  key=$(basename "$f" | cut -d . -f 2)
  if [[ -z ${bashrcd[$key]} ]]; then
    #echo -ne "\033[2K"\\r"Sourcing $f"
    # shellcheck source=/dev/null
    source "$f"
    bashrcd[$key]=1
  fi
done
#echo -e "\033[2K"\\r".bashrc.d done"
