#!/usr/bin/env bash
ansi_mappings=(
  Black
  Red
  Green
  Yellow
  Blue
  Magenta
  Cyan
  ''
  ''
  ''
  ''
  ''
  ''
  ''
  ''
  ''
  Orange
  Purple
  ''
  ''
  ''
  ''
)
colors=(
  base00
  base08
  base0B
  base0A
  base0D
  base0E
  base0C
  base05
  base03
  base08
  base0B
  base0A
  base0D
  base0E
  base0C
  base07
  base09
  base0F
  base01
  base02
  base04
  base06
)
for padded_value in 00 01 02 03 04 05 06 07 08 15 16 17 18 19 20 21; do
  color_variable="color${padded_value}"
  eval current_color=\$${color_variable}
  current_color=$(echo ${current_color//\//} | tr '[:lower:]' '[:upper:]') # get rid of slashes, and uppercase
  non_padded_value=$((10#$padded_value))
  base16_color_name=${colors[$non_padded_value]}
  ansi_label=${ansi_mappings[$non_padded_value]}
  block=$(printf "\x1b[48;5;${non_padded_value}m___________________________")
  foreground=$(printf "\x1b[38;5;${non_padded_value}m")
  printf "%s %s %-16s %s%s\x1b[0m\n" $base16_color_name $color_variable ${ansi_label:-""} $foreground $block
done | sort
