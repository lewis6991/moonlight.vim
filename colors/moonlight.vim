" GUI color definitions
let s:gui00 = "#0b1c2c"
let s:gui01 = "#102336"
let s:gui02 = "#162b40"
let s:gui03 = "#223b54"
let s:gui04 = "#314b66"
let s:gui05 = "#405c79"
let s:gui06 = "#627e99"
let s:gui07 = "#aabcce"
let s:gui08 = "#cbd6e2"
let s:gui09 = "#bf8b56"
let s:gui0A = "#bfbf56"
let s:gui0B = "#8bbf56"
let s:gui0C = "#56bf8b"
let s:gui0D = "#568bbf"
let s:gui0E = "#8b56bf"
let s:gui0F = "#bf568b"
let s:gui10 = "#bf5656"

" Theme setup
hi clear
syntax reset
let g:colors_name = "moonlight"

" Highlighting function
function <sid>hi(group, guifg, guibg, attr, guisp)
    let l:cmd = "highlight ".a:group
    if a:guifg != ""
        let l:cmd .= " guifg=".a:guifg
    endif
    if a:guibg != ""
        let l:cmd .= " guibg=".a:guibg
    endif
    if a:attr != ""
        let l:cmd .= " gui=".a:attr." cterm=".a:attr
    endif
    if a:guisp != ""
        let l:cmd .= " guisp=".a:guisp
    endif

    execute l:cmd
endfunction

" Vim editor colors
call <sid>hi("Bold"        , ""     , ""     , "bold", "")
call <sid>hi("Debug"       , s:gui09, ""     , ""    , "")
call <sid>hi("Directory"   , s:gui0E, ""     , ""    , "")
call <sid>hi("Error"       , s:gui00, s:gui09, ""    , "")
call <sid>hi("ErrorMsg"    , s:gui09, s:gui00, ""    , "")
call <sid>hi("Exception"   , s:gui09, ""     , ""    , "")
call <sid>hi("FoldColumn"  , s:gui0D, s:gui03, ""    , "")
call <sid>hi("Folded"      , s:gui06, s:gui02, ""    , "")
call <sid>hi("IncSearch"   , s:gui03, s:gui0B, "none", "")
call <sid>hi("Italic"      , ""     , ""     , "none", "")
call <sid>hi("Macro"       , s:gui09, ""     , ""    , "")
call <sid>hi("MatchParen"  , s:gui00, s:gui06, ""    , "")
call <sid>hi("ModeMsg"     , s:gui0C, ""     , ""    , "")
call <sid>hi("MoreMsg"     , s:gui0C, ""     , ""    , "")
call <sid>hi("Question"    , s:gui0E, ""     , ""    , "")
call <sid>hi("Search"      , s:gui03, s:gui0B, ""    , "")
call <sid>hi("SpecialKey"  , s:gui06, ""     , ""    , "")
call <sid>hi("TooLong"     , s:gui09, ""     , ""    , "")
call <sid>hi("Underlined"  , s:gui09, ""     , ""    , "")
call <sid>hi("Visual"      , ""     , s:gui05, ""    , "")
call <sid>hi("VisualNOS"   , s:gui09, ""     , ""    , "")
call <sid>hi("WarningMsg"  , s:gui09, ""     , ""    , "")
call <sid>hi("WildMenu"    , s:gui09, s:gui0B, ""    , "")
call <sid>hi("Title"       , s:gui0E, ""     , "none", "")
call <sid>hi("Conceal"     , s:gui0E, s:gui00, ""    , "")
call <sid>hi("Cursor"      , s:gui00, s:gui08, ""    , "")
call <sid>hi("NonText"     , s:gui06, ""     , ""    , "")
call <sid>hi("Normal"      , s:gui08, s:gui00, ""    , "")
call <sid>hi("LineNr"      , s:gui04, ""     , ""    , "")
call <sid>hi("SignColumn",   s:gui03, s:gui00, ""    , "")
call <sid>hi("StatusLine"  , s:gui07, s:gui05, "none", "")
call <sid>hi("StatusLineNC", s:gui06, s:gui03, "none", "")
call <sid>hi("VertSplit"   , s:gui05, s:gui05, "none", "")
call <sid>hi("ColorColumn" , ""     , s:gui03, "none", "")
call <sid>hi("CursorColumn", ""     , s:gui03, "none", "")
call <sid>hi("CursorLine"  , ""     , s:gui01, "none", "")
call <sid>hi("CursorLineNr", s:gui06, s:gui03, ""    , "")
call <sid>hi("PMenu"       , s:gui07, s:gui03, "none", "")
call <sid>hi("PMenuSel"    , s:gui03, s:gui07, ""    , "")
call <sid>hi("TabLine"     , s:gui06, s:gui03, "none", "")
call <sid>hi("TabLineFill" , s:gui06, s:gui03, "none", "")
call <sid>hi("TabLineSel"  , s:gui0C, s:gui03, "none", "")

" Standard syntax highlighting
call <sid>hi("Boolean"     , s:gui0A, ""     , ""    , "")
call <sid>hi("Character"   , s:gui09, ""     , ""    , "")
call <sid>hi("Comment"     , s:gui06, ""     , ""    , "")
call <sid>hi("Conditional" , s:gui0F, ""     , ""    , "")
call <sid>hi("Constant"    , s:gui0A, ""     , ""    , "")
call <sid>hi("Define"      , s:gui0F, ""     , "none", "")
call <sid>hi("Delimiter"   , s:gui10, ""     , ""    , "")
call <sid>hi("Float"       , s:gui0A, ""     , ""    , "")
call <sid>hi("Function"    , s:gui0E, ""     , ""    , "")
call <sid>hi("Identifier"  , s:gui09, ""     , "none", "")
call <sid>hi("Include"     , s:gui0E, ""     , ""    , "")
call <sid>hi("Keyword"     , s:gui0F, ""     , ""    , "")
call <sid>hi("Label"       , s:gui0B, ""     , ""    , "")
call <sid>hi("Number"      , s:gui0A, ""     , ""    , "")
call <sid>hi("Operator"    , s:gui08, ""     , "none", "")
call <sid>hi("PreProc"     , s:gui0B, ""     , ""    , "")
call <sid>hi("Repeat"      , s:gui0B, ""     , ""    , "")
call <sid>hi("Special"     , s:gui0D, ""     , ""    , "")
call <sid>hi("SpecialChar" , s:gui10, ""     , ""    , "")
call <sid>hi("Statement"   , s:gui09, ""     , ""    , "")
call <sid>hi("StorageClass", s:gui0B, ""     , ""    , "")
call <sid>hi("String"      , s:gui0C, ""     , ""    , "")
call <sid>hi("Structure"   , s:gui0F, ""     , ""    , "")
call <sid>hi("Tag"         , s:gui0B, ""     , ""    , "")
call <sid>hi("Todo"        , s:gui0B, s:gui03, ""    , "")
call <sid>hi("Type"        , s:gui0B, ""     , "none", "")
call <sid>hi("Typedef"     , s:gui0B, ""     , ""    , "")

" Diff highlighting
call <sid>hi("DiffAdd"    , s:gui0C, s:gui03, "", "")
call <sid>hi("DiffChange" , s:gui06, s:gui03, "", "")
call <sid>hi("DiffDelete" , s:gui09, s:gui03, "", "")
call <sid>hi("DiffText"   , s:gui0E, s:gui03, "", "")
call <sid>hi("DiffAdded"  , s:gui0C, s:gui00, "", "")
call <sid>hi("DiffFile"   , s:gui09, s:gui00, "", "")
call <sid>hi("DiffNewFile", s:gui0C, s:gui00, "", "")
call <sid>hi("DiffLine"   , s:gui0E, s:gui00, "", "")
call <sid>hi("DiffRemoved", s:gui09, s:gui00, "", "")

" Git highlighting
call <sid>hi("gitCommitOverflow", s:gui09, "", "", "")
call <sid>hi("gitCommitSummary" , s:gui0C, "", "", "")

" GitGutter highlighting
hi link GitGutterAdd    DiffAdded
hi link GitGutterChange DiffLine
hi link GitGutterDelete DiffRemoved
call <sid>hi("GitGutterChangeDelete",  s:gui0F, s:gui03, "", "")

" Signify highlighting
hi link SignifySignAdd    DiffAdded
hi link SignifySignChange DiffLine
hi link SignifySignDelete DiffRemoved

" Spelling highlighting
call <sid>hi("SpellBad",   "", s:gui00, "undercurl", s:gui09)
call <sid>hi("SpellLocal", "", s:gui00, "undercurl", s:gui0D)
call <sid>hi("SpellCap",   "", s:gui00, "undercurl", s:gui0E)
call <sid>hi("SpellRare",  "", s:gui00, "undercurl", s:gui0F)

" Remove functions
delf <sid>hi
