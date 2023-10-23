#!/bin/zsh

# First, check if tmux exists
if command -v tmux >/dev/null 2>&1; then
  echo "Tmux installed. Continue setting it up..."
else
  echo "Please install Tmux first."
  exit 1
fi

# Make Tmux plugin directory
mkdir -p ~/.tmux/plugins

# Use Tmux plugins manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Prepare the tmux config file
tmux_config_fn="$HOME/.tmux.conf"
if [[ -e $tmux_config_fn ]]; then
  tstamp=$(date +"%Y%m%d%H%M%S")
  new_fn="$HOME/.tmux.conf.bk.$tstamp"
  echo "Detected the .tmux.conf exists, backing it up to $new_fn"
  mv "$tmux_config_fn" "$new_fn"
fi

cp ./tmux.conf ~/.tmux.conf

echo -e "Done!\n To install the Tmux plugins, please type <prefix>-I, i.e. Ctrl-B Shift-i in a Tmux session"
