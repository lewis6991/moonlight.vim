#!/bin/bash
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Harmonic16 Dark scheme by Jannik Siebert (https://github.com/janniks)

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

add() {
    # echo "obase=16; $((0x$1 + 0x$2))" | bc
    echo "obase=16; x=$((0x$1 + 0x$2)); if(x<16) print 0; x" | bc
}

offset=00

h=d5
m=99
l=5d

br=06
bg=16
bb=22

h1=$(add $h $offset)
m1=$(add $m $offset)
l1=$(add $l $offset)

hr1=$(add $h1 $r); hg1=$(add $h1 $g); hb1=$(add $h1 $b)
mr1=$(add $m1 $r); mg1=$(add $m1 $g); mb1=$(add $m1 $b)
lr1=$(add $l1 $r); lg1=$(add $l1 $g); lb1=$(add $l1 $b)

base00="$br/$bg/$bb" # Base 00
base01="$(add $br 08)/$(add $bg 08)/$(add $bb 08)"
base02="$(add $br 40)/$(add $bg 40)/$(add $bb 40)"
base03="$(add $br 60)/$(add $bg 60)/$(add $bb 60)" # Bright black
base04="$(add $br 80)/$(add $bg 80)/$(add $bb 80)"
base05="$(add $br A8)/$(add $bg A8)/$(add $bb A8)" # White
base06="$(add $br A0)/$(add $bg A0)/$(add $bb A0)"
base07="$(add $br A8)/$(add $bg A8)/$(add $bb A8)" # Bright white
# base02="46/56/66" # Base 02
# base03="66/76/86" # Base 03 - Bright Black
# base04="86/96/A6" # Base 04
# base05="A6/B6/C6" # Base 05 - White
# base06="C6/D6/E6" # Base 06
base07="FF/FF/FF" # Base 07 - Bright White
base08="$h1/$m1/$l1" # Base 08 - Red
base09="$h/$h/$l" # Base 09
base0A="$m1/$h1/$l1" # Base 0A - Yellow
base0B="$l1/$h1/$m1" # Base 0B - Green
base0C="$l1/$m1/$h1" # Base 0C - Cyan
base0D="$m1/$l1/$h1" # Base 0D - Blue
base0E="$h1/$l1/$m1" # Base 0E - Magenta
base0F="$h/$l/$l" # Base 0F
# harmonic

color00=$base00 # Black
color01=$base08 # Red
color02=$base0B # Green
color03=$base0A # Yellow
color04=$base0D # Blue
color05=$base0E # Magenta
color06=$base0C # Cyan
color07=$base05 # White
color08=$base03 # Bright Black
color09=$base08 # Bright Red
color10=$base0B # Bright Green
color11=$base0A # Bright Yellow
color12=$base0D # Bright Blue
color13=$base0E # Bright Magenta
color14=$base0C # Bright Cyan
color15=$base07 # Bright White
color16=$base09
color17=$base0F
color18=$base01
color19=$base02
color20=$base04
color21=$base06
color_foreground=$base05
color_background=$base00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template='\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\'
  printf_template_var='\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\'
  printf_template_custom='\033Ptmux;\033\033]%s%s\033\033\\\033\\'
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template='\033P\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033P\033]%d;rgb:%s\033\\'
  printf_template_custom='\033P\033]%s%s\033\\'
else
  printf_template='\033]4;%d;rgb:%s\033\\'
  printf_template_var='\033]%d;rgb:%s\033\\'
  printf_template_custom='\033]%s%s\033\\'
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg $h1$h1$h1 # foreground
  printf $printf_template_custom Ph $br$bg$bb # background
  printf $printf_template_custom Pi $br$bg$bb # bold color
  printf $printf_template_custom Pj $h1$h1$h1 # selection color
  printf $printf_template_custom Pk $br$bg$bb # selected text color
  printf $printf_template_custom Pl $h1$h1$h1 # cursor
  printf $printf_template_custom Pm $br$bg$bb # cursor text
else
  printf $printf_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    printf $printf_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      printf $printf_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  printf $printf_template_custom 12 ";7" # cursor (reverse video)
fi
