#!/usr/bin/env bash
# Prints every color/style the Yoncé Zed terminal definitions cover.
# Run inside Zed's integrated terminal.

set -euo pipefail

esc=$'\033'

printf '%s\n' "── ANSI 16 ──────────────────────────────────────────"
printf 'normal   '
for i in {0..7}; do
  printf "${esc}[3%dm██ %d${esc}[0m " "$i" "$i"
done
printf '\nbright   '
for i in {0..7}; do
  printf "${esc}[9%dm██ %d${esc}[0m " "$i" "$i"
done
printf '\n\n'

printf '%s\n' "── 256-color ramp (16-231) ─────────────────────────"
for i in $(seq 16 231); do
  printf "${esc}[48;5;%dm  ${esc}[0m" "$i"
  if (( (i - 15) % 36 == 0 )); then
    printf '\n'
  fi
done

printf '\n%s\n' "── grayscale (232-255) ─────────────────────────────"
for i in $(seq 232 255); do
  printf "${esc}[48;5;%dm  ${esc}[0m" "$i"
done
printf '\n\n'

printf '%s\n' "── styles ──────────────────────────────────────────"
printf 'normal    '; printf "${esc}[0mThe quick brown fox${esc}[0m\n"
printf 'bold      '; printf "${esc}[1mThe quick brown fox${esc}[0m\n"
printf 'dim       '; printf "${esc}[2mThe quick brown fox${esc}[0m\n"
printf 'italic    '; printf "${esc}[3mThe quick brown fox${esc}[0m\n"
printf 'underline '; printf "${esc}[4mThe quick brown fox${esc}[0m\n"
printf 'reverse   '; printf "${esc}[7mThe quick brown fox${esc}[0m\n"
printf 'strike    '; printf "${esc}[9mThe quick brown fox${esc}[0m\n\n"

printf '%s\n' "── truecolor background grid ───────────────────────"
for r in 0 51 102 153 204 255; do
  for g in 0 51 102 153 204 255; do
    printf "${esc}[48;2;%d;%d;%dm  ${esc}[0m" "$r" "$g" 128
  done
  printf '\n'
done

printf '\n%s\n' "── Yoncé palette (24-bit foreground) ───────────────"
printf "${esc}[38;2;252;67;132m#fc4384${esc}[0m "
printf "${esc}[38;2;230;219;116m#e6db74${esc}[0m "
printf "${esc}[38;2;152;227;66m#98e342${esc}[0m "
printf "${esc}[38;2;0;167;170m#00a7aa${esc}[0m "
printf "${esc}[38;2;160;111;202m#a06fca${esc}[0m "
printf "${esc}[38;2;243;155;53m#f39b35${esc}[0m "
printf "${esc}[38;2;218;125;174m#da7dae${esc}[0m\n"
