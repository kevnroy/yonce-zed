#!/usr/bin/env bash
set -euo pipefail

readonly SONGS=("Formation" "Halo" "Crazy in Love")

play() {
  local title="${1:-Untitled}"
  local count=0
  while read -r line; do
    ((count++)) || true
    printf '%s: %s\n' "$count" "$line"
  done < <(printf '%s\n' "${SONGS[@]}")
  echo "Now playing: ${title}" >&2
}

if [[ ${#SONGS[@]} -gt 0 && -t 1 ]]; then
  play "${SONGS[0]}"
else
  echo "nothing to play"
fi
