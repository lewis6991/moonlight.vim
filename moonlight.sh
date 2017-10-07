#! /usr/bin/env bash

# This script doesn't support linux console (use 'vconsole' template instead)
if [ "${TERM%%-*}" = 'linux' ]; then
    return 2>/dev/null || exit 0
fi

add() {
    echo "obase=16; x=$((0x$1 + 0x$2)); if(x<16) print 0; x" | bc
}

h=d5
m=99
l=5d

br=05
bg=17
bb=24

gs() {
    echo "$(add $br $1)/$(add $bg $1)/$(add $bb $1)"
}

base00="$(gs 00)" # Black
base01="$(gs 0A)"
base02="$(gs 20)"
base03="$(gs 50)" # Bright black
base04="$(gs 60)"
base05="$(gs C0)" # White
base06="$(gs D0)"
base07="FF/FF/FF" # Base 07 - Bright White
base08="$h/$m/$l" # Base 08 - Red
base09="$h/$h/$l" # Base 09
base0A="$m/$h/$l" # Base 0A - Yellow
base0B="$l/$h/$m" # Base 0B - Green
base0C="$l/$m/$h" # Base 0C - Cyan
base0D="$m/$l/$h" # Base 0D - Blue
base0E="$h/$l/$m" # Base 0E - Magenta
base0F="$h/$l/$l" # Base 0F

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
    base00p=${base00///}
    base02p=${base02///}
    base05p=${base05///}

    # iTerm2 proprietary escape codes
    printf $printf_template_custom Pg $base05p # foreground
    printf $printf_template_custom Ph $base00p # background
    printf $printf_template_custom Pi $base05p # bold color
    printf $printf_template_custom Pj $base02p # selection color
    printf $printf_template_custom Pk $base05p # selected text color
    printf $printf_template_custom Pl $base05p # cursor
    printf $printf_template_custom Pm $base00p # cursor text
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
