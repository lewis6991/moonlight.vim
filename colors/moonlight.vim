" Theme setup
highlight clear
syntax reset
let g:colors_name = 'moonlight'

exec 'source '.expand('<sfile>:p:h').'/colors.vim'
let s:colors = g:colors
unlet g:colors

function! <sid>blend(color1, color2, percent) abort
    let c1r = str2nr(a:color1[1:2], 16)
    let c1g = str2nr(a:color1[3:4], 16)
    let c1b = str2nr(a:color1[5:6], 16)

    let c2r = str2nr(a:color2[1:2], 16)
    let c2g = str2nr(a:color2[3:4], 16)
    let c2b = str2nr(a:color2[5:6], 16)

    let c3r = ((c1r + c2r) * a:percent) / 100
    let c3g = ((c1g + c2g) * a:percent) / 100
    let c3b = ((c1b + c2b) * a:percent) / 100

    return printf('#%2x%2x%2x', c3r, c3g, c3b)
endfunction

" Blend some colors for some variety. Blended colors give some illusion of
" transparency.
for i in ['01', '02', '07', '08', '09', '0B', '0D', '0E', '0F']
    let s:colors.gui[i.'dim1'] = <sid>blend(s:colors.gui['00'], s:colors.gui[i], 20)
    let s:colors.cterm[i.'dim1'] = s:colors.cterm[i]

    let s:colors.gui[i.'dim2'] = <sid>blend(s:colors.gui['00'], s:colors.gui[i], 40)
    let s:colors.cterm[i.'dim2'] = s:colors.cterm[i]

    let s:colors.gui[i.'dim3'] = <sid>blend(s:colors.gui['00'], s:colors.gui[i], 50)
    let s:colors.cterm[i.'dim3'] = s:colors.cterm[i]
endfor

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
let g:terminal_color_2  = s:colors['gui']['0B']
let g:terminal_color_14 = s:colors['gui']['0C']
let g:terminal_color_6  = s:colors['gui']['0C']
let g:terminal_color_12 = s:colors['gui']['0D']
let g:terminal_color_4  = s:colors['gui']['0D']
let g:terminal_color_13 = s:colors['gui']['0E']
let g:terminal_color_5  = s:colors['gui']['0E']
let g:terminal_color_17 = s:colors['gui']['0F']

" Highlighting function
function! <sid>hi(group, fg, bg, attr) abort
    let l:attr = a:attr ==# '' ? 'None' : a:attr
    " execute 'highlight! clear ' a:group
    execute(join([
        \     'highlight',
        \     a:group,
        \     'ctermfg=' . (a:fg ==# '' ? 'None' : s:colors.cterm[a:fg]),
        \     'guifg='   . (a:fg ==# '' ? 'None' : s:colors.gui[a:fg]),
        \     'ctermbg=' . (a:bg ==# '' ? 'None' : s:colors.cterm[a:bg]),
        \     'guibg='   . (a:bg ==# '' ? 'None' : s:colors.gui[a:bg]),
        \     'cterm='   . l:attr,
        \     'gui='     . l:attr
        \ ]))
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
if has('nvim')
    call <sid>hi('Floating', '', '02'  , '')
endif
if has('nvim') || v:version >= 800
    call <sid>hi('Normal'                    , '05', ''  , '')
else
    " Old vim seems to require Normal background to be defined, else it errors
    call <sid>hi('Normal'                    , '05', '00'  , '')
endif
call <sid>hi('LineNr'                    , '03', '01', '')
call <sid>hi('SignColumn'                , '03', '01', '')
call <sid>hi('StatusLine'                , '04', '02dim3', '')
call <sid>hi('StatusLineNC'              , '03', '01', '')
call <sid>hi('VertSplit'                 , '02', ''  , '')
call <sid>hi('ColorColumn'               , ''  , '01', '')
call <sid>hi('CursorColumn'              , ''  , '01', '')
call <sid>hi('CursorLine'                , ''  , '01', '')
call <sid>hi('CursorLineNr'              , '04', '01', '')
call <sid>hi('PMenu'                     , '05', '01', '')
call <sid>hi('PMenuSel'                  , '05', '02', '')
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
call <sid>hi('DiffAdd'                   , ''  , '0Bdim1' , '')
call <sid>hi('DiffChange'                , ''  , '0Ddim1' , '')
call <sid>hi('DiffDelete'                , '08', '02'    , '')
call <sid>hi('DiffText'                  , ''  , '0Ddim1', '')
call <sid>hi('DiffAdded'                 , '0B', '02'    , '')
call <sid>hi('DiffFile'                  , '05', '02'    , '')
call <sid>hi('DiffNewFile'               , '05', '02'    , '')
call <sid>hi('DiffLine'                  , '0A', '02'    , '')
call <sid>hi('DiffRemoved'               , '08', '02'    , '')

" GitSigns highlighting
call <sid>hi('GitSignsAdd'               , '0Bdim2', '01', '')
call <sid>hi('GitSignsChange'            , '0Ddim2', '01', '')
call <sid>hi('GitSignsDelete'            , '08'    , '01', '')

call <sid>hi('GitSignsAddNr'             , '04', '0Bdim1', '')
call <sid>hi('GitSignsChangeNr'          , '04', '0Ddim1', '')
call <sid>hi('GitSignsDeleteNr'          , '04', '02'    , '')

hi link GitSignsAddLn    DiffAdd
hi link GitSignsChangeLn DiffChange
hi link GitSignsDeleteLn DiffDelete

" GitGutter highlighting
hi link GitGutterAdd    GitSignsAdd
hi link GitGutterChange GitSignsChange
hi link GitGutterDelete GitSignsDelete
call <sid>hi('GitGutterChangeDelete'     , '0Edim1', '01', '')

" Signify highlighting
hi link SignifySignAdd    GitSignsAdd
hi link SignifySignChange GitSignsChange
hi link SignifySignDelete GitSignsDelete

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
call <sid>hi('semshiBuiltin'        , '0D', ''  , '')  " Blue
call <sid>hi('semshiGlobal'         , '07', ''  , '')  " Bright white
call <sid>hi('semshiImported'       , '0A', ''  , '')  " Yellow
call <sid>hi('semshiParameter'      , '0C', ''  , '')  " Cyan
call <sid>hi('semshiFree'           , '05', '02', '')

" call <sid>hi('semshiAttribute'      , '0C', ''  , '')
" call <sid>hi('semshiErrorChar'      , '08', '03', '')
" call <sid>hi('semshiErrorSign'      , '08', '03', '')
" call <sid>hi('semshiLocal'          , '08', '04', '')
" call <sid>hi('semshiParameterUnused', '0C', '02', '')
" call <sid>hi('semshiSelected'       , ''  , '05', '')
" call <sid>hi('semshiSelf'           , '0C', ''  , '')
" call <sid>hi('semshiUnresolved'     , '08', '03', 'bold')

call <sid>hi('LspDiagnosticsDefaultError'          , '0F'    , '01', '')
call <sid>hi('LspDiagnosticsVirtualTextError'      , '0Fdim2',   '', '')
call <sid>hi('LspDiagnosticsDefaultWarning'        , '09'    , '01', '')
call <sid>hi('LspDiagnosticsVirtualTextWarning'    , '09dim2',   '', '')

" call <sid>hi('LspDiagnosticsDefaultInformation'    , '07'    , '01', '')
" call <sid>hi('LspDiagnosticsVirtualTextInformation', '07dim2',   '', '')

" call <sid>hi('LspDiagnosticsDefaultHint'    , '02'    , '01', '')
" call <sid>hi('LspDiagnosticsVirtualTextHint', '02dim2',   '', '')

