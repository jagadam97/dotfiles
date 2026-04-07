#!/usr/bin/env bash
# Claude Code status line — mirrors Starship config (directory + git + model + context)

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
total_in=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
total_out=$(echo "$input" | jq -r '.context_window.total_output_tokens // empty')

# Truncate directory to last 3 components (mirrors starship truncation_length=3)
if [ -n "$cwd" ]; then
  dir=$(echo "$cwd" | awk -F'/' '{
    n = split($0, parts, "/");
    if (n <= 3) { print $0 }
    else { print "…/" parts[n-2] "/" parts[n-1] "/" parts[n] }
  }')
  # Replace $HOME with ~
  home="$HOME"
  dir="${dir/#$home/~}"
else
  dir="?"
fi

# Git info
git_part=""
if git -C "$cwd" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  status_flags=""
  if [ -n "$(git -C "$cwd" status --porcelain 2>/dev/null)" ]; then
    status_flags="*"
  fi
  if [ -n "$branch" ]; then
    git_part=" [$branch$status_flags]"
  fi
fi

# Context usage
ctx_part=""
if [ -n "$used_pct" ]; then
  ctx_int=$(printf "%.0f" "$used_pct")
  ctx_part=" ctx:${ctx_int}%"
fi

# Model part
model_part=""
if [ -n "$model" ]; then
  model_part=" | $model"
fi

# Token counts
tokens_part=""
if [ -n "$total_in" ] || [ -n "$total_out" ]; then
  in_val=${total_in:-0}
  out_val=${total_out:-0}
  tokens_part=" in:${in_val} out:${out_val}"
fi

printf "%s%s%s%s%s" "$dir" "$git_part" "$model_part" "$ctx_part" "$tokens_part"
