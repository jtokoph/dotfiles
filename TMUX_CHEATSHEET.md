# Tmux Keybinding Cheatsheet

**Prefix Key:** `Ctrl+a` (changed from default `Ctrl+b`)

> **Note:** All keybindings below assume you've pressed the prefix key first, unless otherwise noted.
> For example, `C-a c` means: press `Ctrl+a`, then press `c`.

---

## Prefix & Basics

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a` | Send prefix | Press prefix twice to send `Ctrl+a` to the application |
| `C-a ?` | List keybindings | Show all available keybindings |
| `C-a :` | Command prompt | Enter tmux command mode |

---

## Pane Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a \|` | Split vertical | Split pane vertically (new pane on right) |
| `C-a -` | Split horizontal | Split pane horizontally (new pane below) |
| `C-a h` | Select left pane | Navigate to pane on the left |
| `C-a j` | Select down pane | Navigate to pane below |
| `C-a k` | Select up pane | Navigate to pane above |
| `C-a l` | Select right pane | Navigate to pane on the right |
| `C-a C-h` | Resize left | Resize pane 5 cells to the left (repeatable) |
| `C-a C-j` | Resize down | Resize pane 5 cells down (repeatable) |
| `C-a C-k` | Resize up | Resize pane 5 cells up (repeatable) |
| `C-a C-l` | Resize right | Resize pane 5 cells to the right (repeatable) |
| `C-a >` | Swap pane down | Swap current pane with pane below |
| `C-a <` | Swap pane up | Swap current pane with pane above |
| `C-a z` | Toggle zoom | Maximize/restore current pane |
| `C-a x` | Kill pane | Close current pane (with confirmation) |
| `C-a o` | Display panes | Show pane numbers, type number to select |

---

## Window Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a c` | New window | Create a new window |
| `C-a n` | Next window | Switch to next window (repeatable) |
| `C-a p` | Previous window | Switch to previous window (repeatable) |
| `C-a 1-9` | Select window | Switch to window by number (1-9) |
| `C-a 0` | Select window 10 | Switch to window 10 |
| `C-a ,` | Rename window | Rename current window |
| `C-a &` | Kill window | Close current window (with confirmation) |
| `C-a w` | Choose window | Interactively select a window |

---

## Session Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a d` | Detach session | Detach from current session (keeps it running) |
| `C-a s` | Choose session | Interactively select or switch sessions |
| `tmux new -s name` | New session | Create new named session (command line) |
| `tmux attach -t name` | Attach session | Attach to named session (command line) |
| `tmux ls` | List sessions | List all sessions (command line) |
| `tmux kill-session -t name` | Kill session | Kill a named session (command line) |

---

## Copy Mode (Vi-style)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a [` | Enter copy mode | Enter copy/scroll mode |
| `C-a ]` | Paste | Paste from buffer |
| `C-a p` | Paste from clipboard | Paste from system clipboard (macOS) |

### Inside Copy Mode (Vi keybindings)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space` | Start selection | Begin text selection |
| `v` | Begin selection | Begin text selection (vi-style) |
| `y` | Copy selection | Copy selection and exit copy mode |
| `r` | Rectangle toggle | Toggle rectangle selection mode |
| `Enter` | Copy & paste | Copy selection to clipboard and exit |
| `h/j/k/l` | Move cursor | Move cursor (vi-style) |
| `w` | Next word | Move to next word |
| `b` | Previous word | Move to previous word |
| `0` | Start of line | Move to start of line |
| `$` | End of line | Move to end of line |
| `g` | Top of buffer | Move to top of scrollback |
| `G` | Bottom of buffer | Move to bottom of scrollback |
| `Page Up` | Scroll up | Scroll up one page |
| `Page Down` | Scroll down | Scroll down one page |
| `q` or `Escape` | Exit | Exit copy mode |

---

## Miscellaneous

| Keybinding | Action | Description |
|------------|--------|-------------|
| `C-a r` | Reload config | Reload `~/.tmux.conf` configuration |
| `C-a C-l` | Clear screen | Clear screen and history |
| `C-a t` | Show time | Display current time |
| `C-a ?` | List keybindings | Show all keybindings (help) |

---

## Mouse Actions

With mouse support enabled, you can:

| Action | Description |
|--------|-------------|
| **Click pane** | Select/focus a pane |
| **Click window** | Select a window in status bar |
| **Drag border** | Resize panes by dragging borders |
| **Scroll** | Scroll in panes using mouse wheel |
| **Right-click** | Open context menu (if supported) |

---

## Command Line Usage

| Command | Description |
|---------|-------------|
| `tmux` | Start new tmux session |
| `tmux new -s name` | Create new named session |
| `tmux attach -t name` | Attach to named session |
| `tmux attach` | Attach to last session |
| `tmux ls` | List all sessions |
| `tmux kill-session -t name` | Kill named session |
| `tmux kill-server` | Kill all sessions and server |
| `tmux list-keys` | List all keybindings |
| `tmux list-commands` | List all commands |
| `tmux show-options -g` | Show global options |
| `tmux show-options -w` | Show window options |

---

## Tips

- **Repeatable keys**: Keys with `-r` flag (like `C-h`, `C-j`, `C-k`, `C-l` for resizing) can be held down for continuous action
- **Command mode**: Use `C-a :` to enter command mode for advanced operations
- **Copy to clipboard**: In copy mode, `y` or `Enter` copies to system clipboard on macOS
- **Pane paths**: New panes open in the same directory as the current pane
- **Window renumbering**: Windows automatically renumber when one is closed
- **History**: Scrollback history is set to 10,000 lines

---

## Quick Reference Card

### Most Common Operations

```
C-a c          # New window
C-a n/p        # Next/previous window
C-a 1-9        # Switch to window number
C-a \|         # Split vertical
C-a -          # Split horizontal
C-a h/j/k/l    # Navigate panes
C-a z          # Zoom pane
C-a d          # Detach session
C-a r          # Reload config
C-a [          # Enter copy mode
```

---

*Last updated: Configuration uses prefix `Ctrl+a` and vi-style keybindings*
