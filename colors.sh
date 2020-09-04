#! /usr/bin/env bash

H=d5
M=99
L=6f

BR=06
BG=08
BB=10

op() {
    echo "obase=16; x=$((0x$1 $2 0x$3)); if(x<16) print 0; x" | bc
}

gs() {
    echo "$(op $BR + $1)/$(op $BG + $1)/$(op $BB + $1)"
}

base00="$(gs 00)" # Black
base01="$(gs 08)"
base02="$(gs 20)"
base03="$(gs 38)" # Bright black
base04="$(gs 50)"
base05="$(gs B0)" # White
base06="$(gs D0)"
base07="$(gs E0)"
base08="$H/$M/$L" # Red
base0B="$L/$H/$M" # Green
base0A="$M/$H/$L" # Yellow
base0D="$M/$L/$H" # Blue
base0E="$H/$L/$M" # Magenta
base0C="$L/$M/$H" # Cyan
base09="$H/$H/$L" # Orange
base0F="$H/$L/$L" # Purple
