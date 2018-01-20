" Theme setup
hi clear
syntax reset
let g:colors_name = "moonlight"

let s:b00 = "0"
let s:b01 = "18"
let s:b02 = "19"
let s:b03 = "8"
let s:b04 = "20"
let s:b05 = "7"
let s:b06 = "21"
let s:b07 = "15"
let s:b08 = "1"
let s:b09 = "16"
let s:b0A = "3"
let s:b0B = "2"
let s:b0C = "6"
let s:b0D = "4"
let s:b0E = "5"
let s:b0F = "17"

let s:b00_gui = "#051018"
let s:b01_gui = "#0F212E"
let s:b02_gui = "#253744"
let s:b03_gui = "#556774"
let s:b04_gui = "#657784"
let s:b05_gui = "#C5D7E4"
let s:b06_gui = "#D5E7F4"
let s:b07_gui = "#FFFFFF"
let s:b08_gui = "#d5995d"
let s:b09_gui = "#d5d55d"
let s:b0A_gui = "#99d55d"
let s:b0B_gui = "#5dd599"
let s:b0C_gui = "#5d99d5"
let s:b0D_gui = "#995dd5"
let s:b0E_gui = "#d55d99"
let s:b0F_gui = "#d55d5d"

" Highlighting function
function <sid>hi(group, fg, bg, fg_gui, bg_gui, attr)
    let l:cmd = "highlight ".a:group
    if a:fg != ""
        let l:cmd .= " ctermfg=".a:fg
    endif
    if a:bg != ""
        let l:cmd .= " ctermbg=".a:bg
    endif
    if a:fg_gui != ""
        let l:cmd .= " guifg=".a:fg_gui
    endif
    if a:bg_gui != ""
        let l:cmd .= " guibg=".a:bg_gui
    endif
    if a:attr != ""
        let l:cmd .= " cterm=".a:attr
        let l:cmd .= " gui=".a:attr
    endif

    execute "highlight clear ".a:group
    if a:fg != "" || a:bg != "" || a:attr != "" || a:fg_gui != "" || a:bg_gui != ""
        execute l:cmd
    endif
endfunction

" Vim editor colors
call <sid>hi("Bold"      , ""   , ""   , ""       , ""       , "bold")
call <sid>hi("Debug"     , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("Directory" , s:b0D, ""   , s:b0D_gui, ""       , "")
call <sid>hi("Error"     , s:b03, s:b08, s:b03_gui, s:b08_gui, "")
call <sid>hi("ErrorMsg"  , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("Exception" , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("FoldColumn", ""   , ""   , ""       , ""       , "")
call <sid>hi("Folded"    , s:b04, s:b01, s:b04_gui, s:b01_gui, "bold")
call <sid>hi("IncSearch" , s:b01, s:b09, s:b01_gui, s:b09_gui, ""    )
call <sid>hi("Italic"    , ""   , ""   , ""       , ""       , "italic")
call <sid>hi("Macro"     , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("MatchParen", ""   , s:b02, ""       , s:b02_gui, "")
call <sid>hi("ModeMsg"   , s:b0B, ""   , s:b0B_gui, ""       , "")
call <sid>hi("MoreMsg"   , s:b0B, ""   , s:b0B_gui, ""       , "")
call <sid>hi("Question"  , s:b0D, ""   , s:b0D_gui, ""       , "")
call <sid>hi("Search"    , s:b03, s:b0A, s:b03_gui, s:b0A_gui, "")
call <sid>hi("SpecialKey", s:b03, ""   , s:b03_gui, ""       , "")
call <sid>hi("TooLong"   , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("Underlined", ""   , ""   , ""       , ""       , "underline")

call <sid>hi("Visual"      , ""   , s:b02, ""       , s:b02_gui, "")
call <sid>hi("VisualNOS"   , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("WarningMsg"  , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("WildMenu"    , s:b08, ""   , s:b08_gui, ""       , "")
call <sid>hi("Title"       , s:b0D, ""   , s:b0D_gui, ""       , "")
call <sid>hi("Conceal"     , s:b02, s:b00, s:b02_gui, s:b00_gui, "")
call <sid>hi("Cursor"      , ""   , s:b05, ""       , s:b05_gui, "")
call <sid>hi("NonText"     , s:b03, ""   , s:b03_gui, ""       , "")
call <sid>hi("Normal"      , s:b05, s:b00, s:b05_gui, s:b00_gui, "")  "Background is used for airline_error
call <sid>hi("LineNr"      , s:b03, ""   , s:b03_gui, ""       , "")
call <sid>hi("SignColumn"  , s:b03, ""   , s:b03_gui, ""       , "")
call <sid>hi("StatusLine"  , s:b04, s:b02, s:b04_gui, s:b02_gui, "")
call <sid>hi("StatusLineNC", s:b03, s:b01, s:b03_gui, s:b01_gui, "")
call <sid>hi("VertSplit"   , s:b02, s:b02, s:b02_gui, s:b02_gui, "")
call <sid>hi("ColorColumn" , ""   , s:b01, ""       , s:b01_gui, "")
call <sid>hi("CursorColumn", ""   , s:b01, ""       , s:b01_gui, "")
call <sid>hi("CursorLine"  , ""   , s:b01, ""       , s:b01_gui, "")
call <sid>hi("CursorLineNr", s:b04, ""   , s:b04_gui, ""       , "")
call <sid>hi("PMenu"       , s:b05, s:b01, s:b05_gui, s:b01_gui, "")
call <sid>hi("PMenuSel"    , s:b01, s:b05, s:b01_gui, s:b05_gui, "")
call <sid>hi("TabLine"     , s:b03, s:b01, s:b03_gui, s:b01_gui, "")
call <sid>hi("TabLineFill" , s:b03, s:b01, s:b03_gui, s:b01_gui, "")
call <sid>hi("TabLineSel"  , s:b0B, s:b01, s:b0B_gui, s:b01_gui, "")

" Standard syntax highlighting
call <sid>hi("Boolean"     , s:b09, "", s:b09_gui, "", "")
call <sid>hi("Character"   , s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("Comment"     , s:b03, "", s:b03_gui, "", "")
call <sid>hi("Conditional" , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("Constant"    , s:b09, "", s:b09_gui, "", "")
call <sid>hi("Define"      , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("Delimiter"   , s:b0F, "", s:b0F_gui, "", "")
call <sid>hi("Float"       , s:b09, "", s:b09_gui, "", "")
call <sid>hi("Function"    , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("Identifier"  , s:b08, "", s:b08_gui, "", "")
call <sid>hi("Include"     , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("Keyword"     , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("Label"       , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Number"      , s:b09, "", s:b09_gui, "", "")
call <sid>hi("Operator"    , s:b05, "", s:b05_gui, "", "")
call <sid>hi("PreProc"     , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Repeat"      , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Special"     , s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("SpecialChar" , s:b0F, "", s:b0F_gui, "", "")
call <sid>hi("Statement"   , s:b08, "", s:b08_gui, "", "")
call <sid>hi("StorageClass", s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("String"      , s:b0B, "", s:b0B_gui, "", "")
call <sid>hi("Structure"   , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("Tag"         , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Todo"        , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Type"        , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("Typedef"     , s:b0A, "", s:b0A_gui, "", "")

" C highlighting
call <sid>hi("cOperator" , s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("cPreCondit", s:b0E, "", s:b0E_gui, "", "")

" C# highlighting
call <sid>hi("csClass"               , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("csAttribute"           , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("csModifier"            , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("csType"                , s:b08, "", s:b08_gui, "", "")
call <sid>hi("csUnspecifiedStatement", s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("csContextualStatement" , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("csNewDecleration"      , s:b08, "", s:b08_gui, "", "")

" CSS highlighting
call <sid>hi("cssBraces"   , s:b05, "", s:b05_gui, "", "")
call <sid>hi("cssClassName", s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("cssColor"    , s:b0C, "", s:b0C_gui, "", "")

" Diff highlighting
call <sid>hi("DiffAdd"    , s:b0B, s:b01, s:b0B_gui, s:b01_gui, "")
call <sid>hi("DiffChange" , s:b03, s:b01, s:b03_gui, s:b01_gui, "")
call <sid>hi("DiffDelete" , s:b08, s:b01, s:b08_gui, s:b01_gui, "")
call <sid>hi("DiffText"   , s:b0D, s:b01, s:b0D_gui, s:b01_gui, "")
call <sid>hi("DiffAdded"  , s:b0B, s:b00, s:b0B_gui, s:b00_gui, "")
call <sid>hi("DiffFile"   , s:b08, s:b00, s:b08_gui, s:b00_gui, "")
call <sid>hi("DiffNewFile", s:b0B, s:b00, s:b0B_gui, s:b00_gui, "")
call <sid>hi("DiffLine"   , s:b0D, s:b00, s:b0D_gui, s:b00_gui, "")
call <sid>hi("DiffRemoved", s:b08, s:b00, s:b08_gui, s:b00_gui, "")

" Git highlighting
call <sid>hi("gitcommitOverflow"     , s:b08, "", s:b08_gui, "", "")
call <sid>hi("gitcommitSummary"      , s:b0B, "", s:b0B_gui, "", "")
call <sid>hi("gitcommitComment"      , s:b03, "", s:b03_gui, "", "")
call <sid>hi("gitcommitUntracked"    , s:b03, "", s:b03_gui, "", "")
call <sid>hi("gitcommitDiscarded"    , s:b03, "", s:b03_gui, "", "")
call <sid>hi("gitcommitSelected"     , s:b03, "", s:b03_gui, "", "")
call <sid>hi("gitcommitHeader"       , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("gitcommitSelectedType" , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("gitcommitUnmergedType" , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("gitcommitDiscardedType", s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("gitcommitBranch"       , s:b09, "", s:b09_gui, "", "bold")
call <sid>hi("gitcommitUntrackedFile", s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("gitcommitUnmergedFile" , s:b08, "", s:b08_gui, "", "bold")
call <sid>hi("gitcommitDiscardedFile", s:b08, "", s:b08_gui, "", "bold")
call <sid>hi("gitcommitSelectedFile" , s:b0B, "", s:b0B_gui, "", "bold")

" Diff highlighting
call <sid>hi("DiffAdd"    , s:b0B, s:b01, s:b0B_gui, s:b01_gui, "")
call <sid>hi("DiffChange" , s:b0E, s:b01, s:b0E_gui, s:b01_gui, "")
call <sid>hi("DiffDelete" , s:b08, s:b01, s:b08_gui, s:b01_gui, "")
call <sid>hi("DiffText"   , s:b05, s:b01, s:b05_gui, s:b01_gui, "")
call <sid>hi("DiffAdded"  , s:b0B, s:b01, s:b0B_gui, s:b01_gui, "")
call <sid>hi("DiffFile"   , s:b05, s:b01, s:b05_gui, s:b01_gui, "")
call <sid>hi("DiffNewFile", s:b05, s:b01, s:b05_gui, s:b01_gui, "")
call <sid>hi("DiffLine"   , s:b0A, s:b01, s:b0A_gui, s:b01_gui, "")
call <sid>hi("DiffRemoved", s:b08, s:b01, s:b08_gui, s:b01_gui, "")

" Git highlighting
call <sid>hi("gitCommitOverflow", s:b05, "", s:b05_gui, "", "")
call <sid>hi("gitCommitSummary" , s:b05, "", s:b05_gui, "", "")

" GitGutter highlighting
call <sid>hi("GitGutterAdd"         , s:b0B, "", s:b0B_gui, "", "")
call <sid>hi("GitGutterChange"      , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("GitGutterDelete"      , s:b08, "", s:b08_gui, "", "")
call <sid>hi("GitGutterChangeDelete", s:b0E, "", s:b0E_gui, "", "")

" Signify highlighting
hi link SignifySignAdd    GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete

" HTML highlighting
call <sid>hi("htmlBold"  , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("htmlItalic", s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("htmlEndTag", s:b05, "", s:b05_gui, "", "")
call <sid>hi("htmlTag"   , s:b05, "", s:b05_gui, "", "")

" JavaScript highlighting
call <sid>hi("javaScript"      , s:b05, "", s:b05_gui, "", "")
call <sid>hi("javaScriptBraces", s:b05, "", s:b05_gui, "", "")
call <sid>hi("javaScriptNumber", s:b09, "", s:b09_gui, "", "")

" pangloss/vim-javascript highlighting
call <sid>hi("jsOperator"         , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("jsStatement"        , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("jsReturn"           , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("jsThis"             , s:b08, "", s:b08_gui, "", "")
call <sid>hi("jsClassDefinition"  , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("jsFunction"         , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("jsFuncName"         , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("jsFuncCall"         , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("jsClassFuncName"    , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("jsClassMethodType"  , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("jsRegexpString"     , s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("jsGlobalObjects"    , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("jsGlobalNodeObjects", s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("jsExceptions"       , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("jsBuiltins"         , s:b0A, "", s:b0A_gui, "", "")

" Mail highlighting
call <sid>hi("mailQuoted1", s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("mailQuoted2", s:b0B, "", s:b0B_gui, "", "")
call <sid>hi("mailQuoted3", s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("mailQuoted4", s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("mailQuoted5", s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("mailQuoted6", s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("mailURL"    , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("mailEmail"  , s:b0D, "", s:b0D_gui, "", "")

" Markdown highlighting
call <sid>hi("markdownCode"            , s:b0B, ""   , s:b0B_gui, ""       , "")
call <sid>hi("markdownError"           , s:b05, s:b00, s:b05_gui, s:b00_gui, "")
call <sid>hi("markdownCodeBlock"       , s:b0B, ""   , s:b0B_gui, ""       , "")
call <sid>hi("markdownHeadingDelimiter", s:b0D, ""   , s:b0D_gui, ""       , "")

" NERDTree highlighting
call <sid>hi("NERDTreeDirSlash", s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("NERDTreeExecFile", s:b05, "", s:b05_gui, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector", s:b05,  "", s:b05_gui, "", "")
call <sid>hi("phpComparison"    , s:b05,  "", s:b05_gui, "", "")
call <sid>hi("phpParent"        , s:b05,  "", s:b05_gui, "", "")

" Python highlighting
call <sid>hi("pythonOperator" , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("pythonRepeat"   , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("pythonInclude"  , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("pythonStatement", s:b0E, "", s:b0E_gui, "", "")

" Ruby highlighting
call <sid>hi("rubyAttribute"             , s:b0D, "", s:b0D_gui, "", "")
call <sid>hi("rubyConstant"              , s:b0A, "", s:b0A_gui, "", "")
call <sid>hi("rubyInterpolationDelimiter", s:b0F, "", s:b0F_gui, "", "")
call <sid>hi("rubyRegexp"                , s:b0C, "", s:b0C_gui, "", "")
call <sid>hi("rubySymbol"                , s:b0B, "", s:b0B_gui, "", "")
call <sid>hi("rubyStringDelimiter"       , s:b0B, "", s:b0B_gui, "", "")

" SASS highlighting
call <sid>hi("sassidChar"   , s:b08, "", s:b08_gui, "", "")
call <sid>hi("sassClassChar", s:b09, "", s:b09_gui, "", "")
call <sid>hi("sassInclude"  , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("sassMixing"   , s:b0E, "", s:b0E_gui, "", "")
call <sid>hi("sassMixinName", s:b0D, "", s:b0D_gui, "", "")

" Spelling highlighting
call <sid>hi("SpellBad"  , "", "", "", "", "undercurl")
call <sid>hi("SpellLocal", "", "", "", "", "undercurl")
call <sid>hi("SpellCap"  , "", "", "", "", "undercurl")
call <sid>hi("SpellRare" , "", "", "", "", "undercurl")

" ALE highlighting
call <sid>hi("ALEErrorSign", s:b08, "", s:b08_gui, "", "")

" Remove functions
delf <sid>hi

unlet s:b00 s:b01 s:b02 s:b03 s:b04 s:b05 s:b06 s:b07
    \ s:b08 s:b09 s:b0A s:b0B s:b0C s:b0D s:b0E s:b0F
