# tmux refresher

Start tmux as a session so that in case of a disconnection you session is still active on the host.

**Default <kbd>prefix</kbd> key is <kbd>⌃ Control</kbd> + <kbd>b</kbd> but we have changed it to <kbd>⌃ Control</kbd> + <kbd>a</kbd>**

## Sessions

Create new tmux session

```bash
tmux new -s session-name
```

Attach to a session

```bash
tmux ls
```

```bash
tmux attach -t session_name
```

Detach from a Session: <kbd>prefix</kbd> <kbd>d</kbd>

Rename a session: <kbd>prefix</kbd> <kbd>,</kbd>

## Copy Mode

Move to Copy Mode: <kbd>prefix</kbd> <kbd>[</kbd>

Use <kbd>page up</kbd> and <kbd>page down</kbd> to move around. Hit <kbd>space</kbd> to enter into copy mode, select text, hit <kbd>⏎ Enter</kbd> to copy into the vim buffer. 

Open vim to paste: <kbd>prefix</kbd> <kbd>]</kbd> to paste

## Synchronize Panes

<kbd>prefix</kbd> <kbd>:setw synchronize-panes</kbd> to synchronize panes and again to disable

## Navigation

Send window as a pane to another window: <kbd>prefix</kbd> <kbd>s</kbd>

Join a window as a pane to current window: <kbd>prefix</kbd> <kbd>j</kbd>

Moving pane to its own window: <kbd>prefix</kbd> <kbd>!</kbd>

Change to the next layout (move through layouts): <kbd>prefix</kbd> <kbd>space</kbd>

Veritcal split: <kbd>prefix</kbd> <kbd>%</kbd>

Horizontal split: <kbd>prefix</kbd> <kbd>"</kbd>

Move around in windows: <kbd>prefix</kbd>  <kbd>↑</kbd><kbd>↓</kbd><kbd>←</kbd><kbd>→</kbd>

Zoom in/out to any windows: <kbd>prefix</kbd> <kbd>z</kbd>

Resize a window: <kbd>prefix</kbd>  <kbd>^</kbd><kbd>↑</kbd><kbd>↓</kbd><kbd>←</kbd><kbd>→</kbd> hold ctrl in this case

Move the window to other layout: <kbd>prefix</kbd> <kbd>{</kbd>

Move the window to other layout: <kbd>prefix</kbd> <kbd>}</kbd>


## Logging

Toggle (start/stop) logging in the current pane.

* Key binding: <kbd>prefix</kbd> <kbd>shift</kbd>+<kbd>p</kbd>
* File name format: `tmux-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
* File path: `$HOME` (user home dir)
  * Example file: `~/tmux-my-session-0-1-20140527T165614.log`

## Screen Capture

Save visible text, in the current pane. Equivalent of a "textual screenshot".

* Key binding: <kbd>prefix</kbd> <kbd>alt</kbd>+<kbd>p</kbd>
* File name format: `tmux-screen-capture-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
* File path: `$HOME` (user home dir)
  * Example file: `tmux-screen-capture-my-session-0-1-20140527T165614.log`

## Save complete history

Save complete pane history to a file. Convenient if you retroactively remember
you need to log/save all the work.

* Key binding: <kbd>prefix</kbd> <kbd>alt</kbd>+<kbd>shift</kbd>+<kbd>p</kbd>
* File name format: `tmux-history-#{session_name}-#{window_index}-#{pane_index}-%Y%m%dT%H%M%S.log`
* File path: `$HOME` (user home dir)
  * Example file: `tmux-history-my-session-0-1-20140527T165614.log`

**NOTE**: this functionality depends on the value of `history-limit` - the number
of lines Tmux keeps in the scrollback buffer. Only what Tmux kept will also be saved, to a file.

Use `set -g history-limit 110000` in .tmux.conf, with modern computers
it is ok to set this option to a high number.

## Clear pane history

Key binding: <kbd>prefix</kbd> <kbd>alt</kbd>+<kbd>c</kbd>

This is just a convenience key binding.
