" Theme setup
hi clear
syntax reset
let g:colors_name = "moonlight"

" Highlighting function
function <sid>hi(group, fg, bg, attr)
    let l:cmd = "highlight ".a:group
    if a:fg != ""
        let l:cmd .= " ctermfg=".a:fg
    endif
    if a:bg != ""
        let l:cmd .= " ctermbg=".a:bg
    endif
    if a:attr != ""
        let l:cmd .= " cterm=".a:attr
    endif

    execute "highlight clear ".a:group
    if a:fg != "" || a:bg != "" || a:attr != ""
        execute l:cmd
    endif
endfunction

" Vim editor colors
call <sid>hi("Bold"        , "7", ""  , "bold")
call <sid>hi("Debug"       , "7", ""  , ""    )
call <sid>hi("Directory"   , "7", ""  , ""    )
call <sid>hi("Error"       , "1", ""  , ""    )
call <sid>hi("ErrorMsg"    , "7", ""  , ""    )
call <sid>hi("Exception"   , "3", ""  , ""    )
call <sid>hi("FoldColumn"  , "" , ""  , ""    )
call <sid>hi("Folded"      , "" , "18", ""    )
call <sid>hi("IncSearch"   , "7", ""  , ""    )
call <sid>hi("Italic"      , "" , ""  , ""    )
call <sid>hi("Macro"       , "7", ""  , ""    )
call <sid>hi("MatchParen"  , "7", ""  , ""    )
call <sid>hi("ModeMsg"     , "7", ""  , ""    )
call <sid>hi("MoreMsg"     , "7", ""  , ""    )
call <sid>hi("Question"    , "7", ""  , ""    )
call <sid>hi("Search"      , "" , "19", ""    )
call <sid>hi("SpecialKey"  , "7", ""  , ""    )
call <sid>hi("TooLong"     , "7", ""  , ""    )
call <sid>hi("Underlined"  , "7", ""  , ""    )
call <sid>hi("Visual"      , "7", "8" , ""    )
call <sid>hi("VisualNOS"   , "7", ""  , ""    )
call <sid>hi("WarningMsg"  , "7", ""  , ""    )
call <sid>hi("WildMenu"    , "7", ""  , ""    )
call <sid>hi("Title"       , "" , ""  , ""    )
call <sid>hi("Conceal"     , "7", ""  , ""    )
call <sid>hi("Cursor"      , "7", ""  , ""    )
call <sid>hi("NonText"     , "7", ""  , ""    )
call <sid>hi("Normal"      , "7", ""  , ""    )
call <sid>hi("LineNr"      , "8", ""  , ""    )
call <sid>hi("SignColumn"  , "7", ""  , ""    )
call <sid>hi("StatusLine"  , "7", ""  , ""    )
call <sid>hi("StatusLineNC", "7", ""  , ""    )
call <sid>hi("VertSplit"   , "7", ""  , ""    )
call <sid>hi("ColorColumn" , "" , ""  , ""    )
call <sid>hi("CursorColumn", "" , ""  , ""    )
call <sid>hi("CursorLine"  , "" , ""  , ""    )
call <sid>hi("CursorLineNr", "" , ""  , ""    )
call <sid>hi("PMenu"       , "" , ""  , ""    )
call <sid>hi("PMenuSel"    , "" , ""  , ""    )
call <sid>hi("TabLine"     , "" , ""  , ""    )
call <sid>hi("TabLineFill" , "" , ""  , ""    )
call <sid>hi("TabLineSel"  , "" , ""  , ""    )

" Standard syntax highlighting
call <sid>hi("Boolean"     , "7" , "", "")
call <sid>hi("Character"   , "7" , "", "")
call <sid>hi("Comment"     , "19", "", "")
call <sid>hi("Conditional" , "12", "", "")
call <sid>hi("Constant"    , "3" , "", "")
call <sid>hi("Define"      , "5" , "", "")
call <sid>hi("Delimiter"   , "7" , "", "")
call <sid>hi("Float"       , "7" , "", "")
call <sid>hi("Function"    , "15", "", "")
call <sid>hi("Identifier"  , "15", "", "")
call <sid>hi("Include"     , "5" , "", "")
call <sid>hi("Keyword"     , "2" , "", "")
call <sid>hi("Label"       , "7" , "", "")
call <sid>hi("Number"      , "5" , "", "")
call <sid>hi("Operator"    , "7" , "", "")
call <sid>hi("PreProc"     , "9" , "", "")
call <sid>hi("Repeat"      , "1" , "", "")
call <sid>hi("Special"     , "7" , "", "")
call <sid>hi("SpecialChar" , "7" , "", "")
call <sid>hi("Statement"   , "12", "", "")
call <sid>hi("StorageClass", "12", "", "")
call <sid>hi("String"      , "2" , "", "")
call <sid>hi("Structure"   , "12", "", "")
call <sid>hi("Tag"         , "7" , "", "")
call <sid>hi("Todo"        , "4" , "", "")
call <sid>hi("Type"        , "12", "", "")
call <sid>hi("Typedef"     , "1" , "", "")

" Diff highlighting
call <sid>hi("DiffAdd"    , "2", "", "")
call <sid>hi("DiffChange" , "5", "", "")
call <sid>hi("DiffDelete" , "1", "", "")
call <sid>hi("DiffText"   , "7", "", "")
call <sid>hi("DiffAdded"  , "2", "", "")
call <sid>hi("DiffFile"   , "7", "", "")
call <sid>hi("DiffNewFile", "7", "", "")
call <sid>hi("DiffLine"   , "3", "", "")
call <sid>hi("DiffRemoved", "1", "", "")

" Git highlighting
call <sid>hi("gitCommitOverflow", "7", "", "")
call <sid>hi("gitCommitSummary" , "7", "", "")

" GitGutter highlighting
hi link GitGutterAdd    DiffAdded
hi link GitGutterChange DiffLine
hi link GitGutterDelete DiffRemoved
call <sid>hi("GitGutterChangeDelete",  "7", "7", "")

" Signify highlighting
hi link SignifySignAdd    DiffAdded
hi link SignifySignChange DiffLine
hi link SignifySignDelete DiffRemoved

" Spelling highlighting
call <sid>hi("SpellBad"  , "1", "", "undercurl")
call <sid>hi("SpellLocal", "" , "", "undercurl")
call <sid>hi("SpellCap"  , "" , "", "undercurl")
call <sid>hi("SpellRare" , "" , "", "undercurl")

" Remove functions
delf <sid>hi
