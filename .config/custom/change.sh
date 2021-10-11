#!/usr/bin/env bash

current_pane_origin=$(tmux display-message -p '#S:#{window_index}.#{pane_index}: #{window_name}')
current_pane=$(tmux display-message -p '#S:#{window_index}.#{pane_index}')

if [[ -z "$TMUX_FZF_PANE_FORMAT" ]]; then
    panes=$(tmux list-panes -a -F "#S:#{window_index}.#{pane_index}: [#{window_name}:#{pane_title}] #{pane_current_command}  [#{pane_width}x#{pane_height}] [history #{history_size}/#{history_limit}, #{history_bytes} bytes] #{?pane_active,[active],[inactive]}")
else
    panes=$(tmux list-panes -a -F "#S:#{window_index}.#{pane_index}: $TMUX_FZF_PANE_FORMAT")
fi

# target=$(tmux display -pt "${TMUX_PANE:?}" '#{pane_index}')
target=$(tmux display -pt -F "#S:#{window_index}.#{pane_index}")
panes=$(echo "$panes" | grep -v "^$target")
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --header='Select target pane.'"

target_swap_origin=$(printf "%s\n[cancel]" "$panes" | tmux-fzf -p -w 80% -h 40%)
[[ "$target_swap_origin" == "[cancel]" || -z "$target_swap_origin" ]] && exit
target_swap=$(echo "$target_swap_origin" | sed 's/: .*//')
tmux swap-pane -s "$target" -t "$target_swap"
