#! /usr/bin/env bash

source ./colors.sh

echo "
let g:colors = {}
let g:colors.cterm = {
    \\     '00' : '0' ,
    \\     '01' : '18',
    \\     '02' : '19',
    \\     '03' : '8' ,
    \\     '04' : '20',
    \\     '05' : '7' ,
    \\     '06' : '21',
    \\     '07' : '15',
    \\     '08' : '1' ,
    \\     '09' : '16',
    \\     '0A' : '3' ,
    \\     '0B' : '2' ,
    \\     '0C' : '6' ,
    \\     '0D' : '4' ,
    \\     '0E' : '5' ,
    \\     '0F' : '17',
    \\ }

let g:colors.gui = {
    \\  '00' : '#${base00//\//}',
    \\  '01' : '#${base01//\//}',
    \\  '02' : '#${base02//\//}',
    \\  '03' : '#${base03//\//}',
    \\  '04' : '#${base04//\//}',
    \\  '05' : '#${base05//\//}',
    \\  '06' : '#${base06//\//}',
    \\  '07' : '#${base07//\//}',
    \\  '08' : '#${base08//\//}',
    \\  '09' : '#${base09//\//}',
    \\  '0A' : '#${base0A//\//}',
    \\  '0B' : '#${base0B//\//}',
    \\  '0C' : '#${base0C//\//}',
    \\  '0D' : '#${base0D//\//}',
    \\  '0E' : '#${base0E//\//}',
    \\  '0F' : '#${base0F//\//}',
    \\ }
" > colors/colors.vim
