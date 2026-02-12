# MyNvimConfig

This configuration is based on the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

Other useful CLI tools and configurations I use:

- Oh-My-Zsh

Plugins I currently use:
```
plugins=(
  git
  z
  vscode
)

Remember to add these to `~/.zshrc`:
```
```
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```


- GitHub Copilot for CLI

```
eval "$(gh copilot alias -- zsh)"
```

- Other CLI  tools

 - htop, btop, nvtop
 - jq
 - lazygit
 - git-lfs
 - riggrep
 - fd
 - duf & dust

## Lazygit config (` ~/.config/lazygit/config.yml`):

```
git:
  commit:
    signOff: true
```


## tmux config(`~/.tmux.conf):

```
# Enable mouse support
set -g mouse on

# Link to system clipboard
set -s set-clipboard on

# Address input delay issues (especially for Vim users)
set -s escape-time 0

# Increase scrollback history limit
set -g history-limit 50000

# Automatically renumber windows when one is closed
set -g renumber-windows on

# More intuitive split pane shortcuts
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# Enable 256-color support
set -g default-terminal "screen-256color"

# Status bar styling
set -g status-style "bg=#333333 fg=#5eacd3"

# Display session name on the left
set -g status-left "#[fg=green,bold] #S "

# Display date and time on the right
set -g status-right "#[fg=yellow]%Y-%m-%d %H:%M "

# Highlight style for the active window
setw -g window-status-current-style "fg=white,bg=#005f87,bold"
setw -g window-status-current-format " #I:#W#F "

# Map Ctrl+0/4 to start/end of line (consistent with Vim logic)
bind -n C-0 send-keys C-a
bind -n C-4 send-keys C-e

# Map Ctrl+b/e to skip words (consistent with Vim logic)
bind -n C-b send-keys M-b
bind -n C-e send-keys M-e
```
