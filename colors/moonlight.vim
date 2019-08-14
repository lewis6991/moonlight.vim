" Theme setup
hi clear
syntax reset
let g:colors_name = 'moonlight'

let s:colors = {
    \     'cterm': {
    \         '00' : '0',
    \         '01' : '18',
    \         '02' : '19',
    \         '03' : '8',
    \         '04' : '20',
    \         '05' : '7',
    \         '06' : '21',
    \         '07' : '15',
    \         '08' : '1',
    \         '09' : '16',
    \         '0A' : '3',
    \         '0B' : '2', '0Bdim': '19',
    \         '0C' : '6', '0Cb' : '6',
    \         '0D' : '4', '0Ddim' : '19', '0Ddim1': '8',
    \         '0E' : '5',
    \         '0F' : '17'
    \     },
    \     'gui': {
    \         '00' : '#040610',
    \         '01' : '#0C0E18',
    \         '02' : '#161822',
    \         '03' : '#444650',
    \         '04' : '#646670',
    \         '05' : '#B4B6C0',
    \         '06' : '#D4D6E0',
    \         '07' : '#FFFFFF',
    \         '08' : '#d5996d',
    \         '09' : '#d5d56d',
    \         '0A' : '#99d56d',
    \         '0B' : '#6dd599',
    \         '0C' : '#6d99d5',
    \         '0D' : '#996dd5',
    \         '0E' : '#d56d99',
    \         '0F' : '#d56d6d',
    \         '0Bdim': '#19332F',
    \         '0Cb' : '#9FCCF8',
    \         '0Ddim' : '#221E3B', '0Ddim1' : '#4F3C75',
    \     }
    \ }

" 0Bdim : https://meyerweb.com/eric/tools/color-blend/#040A14:6DD599:4:hex
" 0Ddim : https://meyerweb.com/eric/tools/color-blend/#040A14:996DD5:4:hex
" 0Ddim1: https://meyerweb.com/eric/tools/color-blend/#040A14:996DD5:1:hex

" Neovim terminal
let g:terminal_color_0  = s:colors['gui']['00']
let g:terminal_color_18 = s:colors['gui']['01']
let g:terminal_color_19 = s:colors['gui']['02']
let g:terminal_color_8  = s:colors['gui']['03']
let g:terminal_color_20 = s:colors['gui']['04']
let g:terminal_color_7  = s:colors['gui']['05']
let g:terminal_color_21 = s:colors['gui']['06']
let g:terminal_color_15 = s:colors['gui']['07']
let g:terminal_color_1  = s:colors['gui']['08']
let g:terminal_color_9  = s:colors['gui']['08']
let g:terminal_color_16 = s:colors['gui']['09']
let g:terminal_color_11 = s:colors['gui']['0A']
let g:terminal_color_3  = s:colors['gui']['0A']
let g:terminal_color_10 = s:colors['gui']['0B']
let g:terminal_color_02 = s:colors['gui']['0B']
let g:terminal_color_14 = s:colors['gui']['0C']
let g:terminal_color_6  = s:colors['gui']['0C']
let g:terminal_color_12 = s:colors['gui']['0D']
let g:terminal_color_4  = s:colors['gui']['0D']
let g:terminal_color_13 = s:colors['gui']['0E']
let g:terminal_color_5  = s:colors['gui']['0E']
let g:terminal_color_17 = s:colors['gui']['0F']

" Highlighting function
function! <sid>hi(group, fg, bg, attr)
    " let l:cmd = 'highlight '.a:group
    let l:cmd = ['highlight', a:group]

    if a:fg !=# ''
        let l:cmd += [
            \     'ctermfg='.s:colors['cterm'][a:fg],
            \     'guifg='.s:colors['gui'][a:fg]
            \ ]
    endif

    if a:bg !=# ''
        let l:cmd += [
            \     'ctermbg='.s:colors['cterm'][a:bg],
            \     'guibg='.s:colors['gui'][a:bg]
            \ ]
    endif

    if a:attr !=# ''
        let l:cmd += ['cterm='.a:attr, 'gui='.a:attr]
    endif

    execute('highlight clear '.a:group)
    if a:fg !=# '' || a:bg !=# '' || a:attr !=# ''
        execute(join(l:cmd))
    endif
endfunction

" Vim editor colors
call <sid>hi('Bold'                      , ''  , ''  , 'bold')
call <sid>hi('Debug'                     , '08', ''  , '')
call <sid>hi('Directory'                 , '0D', ''  , '')
call <sid>hi('Error'                     , '03', '08', '')
call <sid>hi('ErrorMsg'                  , '08', ''  , '')
call <sid>hi('Exception'                 , '08', ''  , '')
call <sid>hi('FoldColumn'                , '03', '01', '')
call <sid>hi('Folded'                    , '04', '01', 'bold')
call <sid>hi('IncSearch'                 , '01', '09', ''    )
call <sid>hi('Italic'                    , ''  , ''  , 'italic')
call <sid>hi('Macro'                     , '08', ''  , '')
call <sid>hi('MatchParen'                , ''  , '02', '')
call <sid>hi('ModeMsg'                   , '0B', ''  , '')
call <sid>hi('MoreMsg'                   , '0B', ''  , '')
call <sid>hi('Question'                  , '0D', ''  , '')
call <sid>hi('SpecialKey'                , '03', ''  , '')
call <sid>hi('TooLong'                   , '08', ''  , '')
call <sid>hi('Underlined'                , ''  , ''  , 'underline')

" https://github.com/timakro/vim-searchant
call <sid>hi('Search'                    , '0A', '03', '')
call <sid>hi('SearchCurrent'             , '03', '0A', '')

call <sid>hi('Visual'                    , ''  , '02', '')
call <sid>hi('VisualNOS'                 , '08', ''  , '')
call <sid>hi('WarningMsg'                , '08', ''  , '')
call <sid>hi('WildMenu'                  , '08', '02', '')
call <sid>hi('Title'                     , '0D', ''  , '')
call <sid>hi('Conceal'                   , '02', '00', '')
call <sid>hi('Cursor'                    , ''  , '05', '')
call <sid>hi('NonText'                   , '03', ''  , '')
call <sid>hi('Normal'                    , '05', '00', '')  "Background is used for airline_error
call <sid>hi('LineNr'                    , '03', '01', '')
call <sid>hi('SignColumn'                , '03', '01', '')
call <sid>hi('StatusLine'                , '04', '02', '')
call <sid>hi('StatusLineNC'              , '03', '01', '')
call <sid>hi('VertSplit'                 , '02', '02', '')
call <sid>hi('ColorColumn'               , ''  , '01', '')
call <sid>hi('CursorColumn'              , ''  , '01', '')
call <sid>hi('CursorLine'                , ''  , '01', '')
call <sid>hi('CursorLineNr'              , '04', '01', '')
call <sid>hi('PMenu'                     , '05', '01', '')
call <sid>hi('PMenuSel'                  , '01', '05', '')
call <sid>hi('TabLine'                   , '03', '01', '')
call <sid>hi('TabLineFill'               , '03', '01', '')
call <sid>hi('TabLineSel'                , '05', '02', '')

" Standard syntax highlighting
call <sid>hi('Boolean'                   , '09', ''  , '')
call <sid>hi('Character'                 , '0C', ''  , '')
call <sid>hi('Comment'                   , '03', ''  , 'italic')
call <sid>hi('Conditional'               , '0E', ''  , '')
call <sid>hi('Constant'                  , '09', ''  , '')
call <sid>hi('Define'                    , '0E', ''  , '')
call <sid>hi('Delimiter'                 , '0F', ''  , '')
call <sid>hi('Float'                     , '09', ''  , '')
call <sid>hi('Function'                  , '0D', ''  , '')
call <sid>hi('Identifier'                , '08', ''  , '')
call <sid>hi('Include'                   , '0D', ''  , '')
call <sid>hi('Keyword'                   , '0E', ''  , '')
call <sid>hi('Label'                     , '0A', ''  , '')
call <sid>hi('Number'                    , '09', ''  , '')
call <sid>hi('Operator'                  , '05', ''  , '')
call <sid>hi('PreProc'                   , '0A', ''  , '')
call <sid>hi('Repeat'                    , '0A', ''  , '')
call <sid>hi('Special'                   , '0C', ''  , '')
call <sid>hi('SpecialChar'               , '0F', ''  , '')
call <sid>hi('Statement'                 , '08', ''  , '')
call <sid>hi('StorageClass'              , '0A', ''  , '')
call <sid>hi('String'                    , '0B', ''  , '')
call <sid>hi('Structure'                 , '0E', ''  , '')
call <sid>hi('Tag'                       , '0A', ''  , '')
call <sid>hi('Todo'                      , '0A', ''  , '')
call <sid>hi('Type'                      , '0A', ''  , '')
call <sid>hi('Typedef'                   , '0A', ''  , '')

" C highlighting
call <sid>hi('cOperator'                 , '0C', ''  , '')
call <sid>hi('cPreCondit'                , '0E', ''  , '')

" C# highlighting
call <sid>hi('csClass'                   , '0A', ''  , '')
call <sid>hi('csAttribute'               , '0A', ''  , '')
call <sid>hi('csModifier'                , '0E', ''  , '')
call <sid>hi('csType'                    , '08', ''  , '')
call <sid>hi('csUnspecifiedStatement'    , '0D', ''  , '')
call <sid>hi('csContextualStatement'     , '0E', ''  , '')
call <sid>hi('csNewDecleration'          , '08', ''  , '')

" CSS highlighting
call <sid>hi('cssBraces'                 , '05', ''  , '')
call <sid>hi('cssClassName'              , '0E', ''  , '')
call <sid>hi('cssColor'                  , '0C', ''  , '')

" Git highlighting
call <sid>hi('gitcommitOverflow'         , '08', ''  , '')
call <sid>hi('gitcommitSummary'          , '0B', ''  , '')
call <sid>hi('gitcommitComment'          , '03', ''  , '')
call <sid>hi('gitcommitUntracked'        , '03', ''  , '')
call <sid>hi('gitcommitDiscarded'        , '03', ''  , '')
call <sid>hi('gitcommitSelected'         , '03', ''  , '')
call <sid>hi('gitcommitHeader'           , '0E', ''  , '')
call <sid>hi('gitcommitSelectedType'     , '0D', ''  , '')
call <sid>hi('gitcommitUnmergedType'     , '0D', ''  , '')
call <sid>hi('gitcommitDiscardedType'    , '0D', ''  , '')
call <sid>hi('gitcommitBranch'           , '09', ''  , 'bold')
call <sid>hi('gitcommitUntrackedFile'    , '0A', ''  , '')
call <sid>hi('gitcommitUnmergedFile'     , '08', ''  , 'bold')
call <sid>hi('gitcommitDiscardedFile'    , '08', ''  , 'bold')
call <sid>hi('gitcommitSelectedFile'     , '0B', ''  , 'bold')

" Diff highlighting
call <sid>hi('DiffAdd'                   , ''  , '0Bdim' , '')
call <sid>hi('DiffChange'                , ''  , '0Ddim' , '')
call <sid>hi('DiffDelete'                , '08', '02'    , '')
call <sid>hi('DiffText'                  , ''  , '0Ddim1', '')
call <sid>hi('DiffAdded'                 , '0B', '02'    , '')
call <sid>hi('DiffFile'                  , '05', '02'    , '')
call <sid>hi('DiffNewFile'               , '05', '02'    , '')
call <sid>hi('DiffLine'                  , '0A', '02'    , '')
call <sid>hi('DiffRemoved'               , '08', '02'    , '')

" GitGutter highlighting
call <sid>hi('GitGutterAdd'              , '0B', '01', '')
call <sid>hi('GitGutterChange'           , '0D', '01', '')
call <sid>hi('GitGutterDelete'           , '08', '01', '')
call <sid>hi('GitGutterChangeDelete'     , '0E', '01', '')

" Signify highlighting
hi link SignifySignAdd    GitGutterAdd
hi link SignifySignChange GitGutterChange
hi link SignifySignDelete GitGutterDelete

" HTML highlighting
call <sid>hi('htmlBold'                  , '0A', ''  , '')
call <sid>hi('htmlItalic'                , '0E', ''  , '')
call <sid>hi('htmlEndTag'                , '05', ''  , '')
call <sid>hi('htmlTag'                   , '05', ''  , '')

" JavaScript highlighting
call <sid>hi('javaScript'                , '05', ''  , '')
call <sid>hi('javaScriptBraces'          , '05', ''  , '')
call <sid>hi('javaScriptNumber'          , '09', ''  , '')

" pangloss/vim-javascript highlighting
call <sid>hi('jsOperator'                , '0D', ''  , '')
call <sid>hi('jsStatement'               , '0E', ''  , '')
call <sid>hi('jsReturn'                  , '0E', ''  , '')
call <sid>hi('jsThis'                    , '08', ''  , '')
call <sid>hi('jsClassDefinition'         , '0A', ''  , '')
call <sid>hi('jsFunction'                , '0E', ''  , '')
call <sid>hi('jsFuncName'                , '0D', ''  , '')
call <sid>hi('jsFuncCall'                , '0D', ''  , '')
call <sid>hi('jsClassFuncName'           , '0D', ''  , '')
call <sid>hi('jsClassMethodType'         , '0E', ''  , '')
call <sid>hi('jsRegexpString'            , '0C', ''  , '')
call <sid>hi('jsGlobalObjects'           , '0A', ''  , '')
call <sid>hi('jsGlobalNodeObjects'       , '0A', ''  , '')
call <sid>hi('jsExceptions'              , '0A', ''  , '')
call <sid>hi('jsBuiltins'                , '0A', ''  , '')

" Mail highlighting
call <sid>hi('mailQuoted1'               , '0A', ''  , '')
call <sid>hi('mailQuoted2'               , '0B', ''  , '')
call <sid>hi('mailQuoted3'               , '0E', ''  , '')
call <sid>hi('mailQuoted4'               , '0C', ''  , '')
call <sid>hi('mailQuoted5'               , '0D', ''  , '')
call <sid>hi('mailQuoted6'               , '0A', ''  , '')
call <sid>hi('mailURL'                   , '0D', ''  , '')
call <sid>hi('mailEmail'                 , '0D', ''  , '')

" Markdown highlighting
call <sid>hi('markdownCode'              , '0B', ''  , '')
call <sid>hi('markdownError'             , '05', '00', '')
call <sid>hi('markdownCodeBlock'         , '0B', ''  , '')
call <sid>hi('markdownHeadingDelimiter'  , '0D', ''  , '')

" NERDTree highlighting
call <sid>hi('NERDTreeDirSlash'          , '0D', ''  , '')
call <sid>hi('NERDTreeExecFile'          , '05', ''  , '')

" PHP highlighting
call <sid>hi('phpMemberSelector'         , '05', ''  , '')
call <sid>hi('phpComparison'             , '05', ''  , '')
call <sid>hi('phpParent'                 , '05', ''  , '')

" Python highlighting
call <sid>hi('pythonOperator'            , '0E', ''  , '')
call <sid>hi('pythonRepeat'              , '0E', ''  , '')
call <sid>hi('pythonInclude'             , '0E', ''  , '')
call <sid>hi('pythonStatement'           , '0E', ''  , '')

" Ruby highlighting
call <sid>hi('rubyAttribute'             , '0D', ''  , '')
call <sid>hi('rubyConstant'              , '0A', ''  , '')
call <sid>hi('rubyInterpolationDelimiter', '0F', ''  , '')
call <sid>hi('rubyRegexp'                , '0C', ''  , '')
call <sid>hi('rubySymbol'                , '0B', ''  , '')
call <sid>hi('rubyStringDelimiter'       , '0B', ''  , '')

" SASS highlighting
call <sid>hi('sassidChar'                , '08', ''  , '')
call <sid>hi('sassClassChar'             , '09', ''  , '')
call <sid>hi('sassInclude'               , '0E', ''  , '')
call <sid>hi('sassMixing'                , '0E', ''  , '')
call <sid>hi('sassMixinName'             , '0D', ''  , '')

" Spelling highlighting
call <sid>hi('SpellBad'                  , ''  , ''  , 'undercurl')
call <sid>hi('SpellLocal'                , ''  , ''  , 'undercurl')
call <sid>hi('SpellCap'                  , ''  , ''  , 'undercurl')
call <sid>hi('SpellRare'                 , ''  , ''  , 'undercurl')

" ALE highlighting
call <sid>hi('ALEErrorSign'              , '08', ''  , '')

" Statusbar highlighting
call <sid>hi('StatusbarHunksModified'    , '0D', '02', '')
call <sid>hi('StatusbarHunksDeleted'     , '08', '02', '')
call <sid>hi('StatusbarHunksAdded'       , '0B', '02', '')
call <sid>hi('StatusbarHunks'            , '05', '02', '')

" https://github.com/numirias/semshi
function! <sid>semshi_hi()
    call <sid>hi('semshiLocal'          , '08' , '04', '')
    call <sid>hi('semshiGlobal'         , '07' , ''  , '')  " Bright white
    call <sid>hi('semshiImported'       , '0A' , ''  , '')  " Yellow
    call <sid>hi('semshiParameter'      , '0Cb', ''  , '')  " Cyan
    call <sid>hi('semshiParameterUnused', '0Cb', '02', '')
    call <sid>hi('semshiFree'           , '05' , '02', '')
    call <sid>hi('semshiBuiltin'        , '0D' , ''  , '')  " Blue
    call <sid>hi('semshiAttribute'      , '0C' , ''  , '')
    call <sid>hi('semshiSelf'           , '0C' , ''  , '')
    call <sid>hi('semshiUnresolved'     , '08' , '03', 'bold')
    call <sid>hi('semshiSelected'       , ''   , '05', '')
    call <sid>hi('semshiErrorSign'      , '08' , '03', '')
    call <sid>hi('semshiErrorChar'      , '08' , '03', '')
endfunction

autocmd! FileType python
    \ | if exists('g:semshi#active')
    \ |     call <sid>semshi_hi()
    \ | endif
