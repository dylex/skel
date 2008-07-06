hi clear
hi SpecialKey    term=bold ctermfg=4
hi NonText       term=bold cterm=bold ctermfg=4
hi Directory     term=bold ctermfg=4
hi ErrorMsg      term=standout cterm=bold ctermfg=7 ctermbg=1
hi IncSearch     term=reverse cterm=reverse
hi Search        term=reverse ctermfg=0 ctermbg=3
hi MoreMsg       term=bold ctermfg=2
hi ModeMsg       term=bold cterm=bold
hi LineNr        term=underline ctermfg=3
hi Question      term=standout ctermfg=2
hi StatusLine    term=bold,reverse cterm=bold,reverse,reverse
hi StatusLineNC  term=reverse cterm=reverse
hi VertSplit     term=reverse cterm=reverse
hi Title         term=bold ctermfg=5
hi Visual        term=reverse cterm=reverse
hi VisualNOS     term=bold,underline cterm=bold,underline,underline
hi WarningMsg    term=standout ctermfg=1
hi WildMenu      term=standout ctermfg=0 ctermbg=3
hi Folded        term=standout ctermfg=4 ctermbg=7
hi FoldColumn    term=standout ctermfg=4 ctermbg=7
hi DiffAdd       term=bold ctermbg=4
hi DiffChange    term=bold ctermbg=5
hi DiffDelete    term=bold cterm=bold ctermfg=4 ctermbg=6
hi DiffText      term=reverse cterm=bold ctermbg=1
hi SignColumn    NONE
hi clear SpellBad
hi SpellBad      term=reverse cterm=underline ctermfg=1
hi clear SpellCap
hi SpellCap      term=reverse cterm=underline ctermfg=4
hi clear SpellRare
hi SpellRare     term=reverse cterm=underline ctermfg=5
hi clear SpellLocal
hi SpellLocal    term=underline cterm=underline ctermfg=6
hi Pmenu         ctermbg=5
hi PmenuSel      ctermbg=0
hi PmenuSbar     ctermbg=7
hi PmenuThumb    cterm=reverse
hi TabLine       term=underline cterm=underline ctermfg=0 ctermbg=7
hi TabLineSel    term=bold cterm=bold
hi TabLineFill   term=reverse cterm=reverse
hi CursorColumn  term=reverse ctermbg=7
hi CursorLine    term=underline cterm=underline
hi Cursor        guibg=grey guifg=black
hi lCursor       guibg=grey guibg=black
hi clear MatchParen
hi MatchParen    term=reverse cterm=bold,underline
hi Normal        guibg=black guifg=grey
hi Comment       term=bold ctermfg=4
hi Constant      term=underline ctermfg=1
hi link String         Constant
hi link Character      Constant
hi link Number         Constant
hi link Float          Number
hi link Boolean        Constant
hi Special       term=bold ctermfg=5
hi link Tag            Special
hi link SpecialChar    Special
hi link Delimiter      Special
hi link SpecialComment Special
hi link Debug          Special
hi Identifier    term=underline ctermfg=6
hi link Function       Identifier
hi Statement     term=bold ctermfg=3
hi link Conditional    Statement
hi link Repeat         Statement
hi link Label          Statement
hi link Operator       Statement
hi link Keyword        Statement
hi link Exception      Statement
hi PreProc       term=underline ctermfg=5
hi link Include        PreProc
hi link Define         PreProc
hi link Macro          PreProc
hi link PreCondit      PreProc
hi Type          term=underline ctermfg=2
hi link StorageClass   Type
hi link Structure      Type
hi link Typedef        Type
hi Underlined    term=underline cterm=underline
hi Ignore        ctermfg=8
hi Error         term=reverse cterm=bold ctermfg=7 ctermbg=1
hi Todo          term=standout ctermfg=0 ctermbg=3

if &t_Co == 256
	hi LineNr 	ctermfg=230
	hi Comment 	ctermfg=111
	hi Constant 	ctermfg=174
	hi Character 	ctermfg=125
	hi String 	ctermfg=126
	hi Number 	ctermfg=130
	hi Float 	ctermfg=136
	hi Boolean 	ctermfg=124
	hi Special	ctermfg=164
	hi Tag		ctermfg=133
	hi SpecialChar	ctermfg=162
	hi Delimiter	ctermfg=135
	hi SpecialComment ctermfg=141
	hi Debug	ctermfg=127
	hi Identifier 	ctermfg=44 cterm=none
	hi Function	ctermfg=123
	hi Statement	ctermfg=3
	hi Conditional	ctermfg=142
	hi Repeat	ctermfg=184
	hi Label	ctermfg=137
	hi Operator	ctermfg=191
	hi Keyword	ctermfg=144
	hi Exception	ctermfg=178
	hi PreProc	ctermfg=213
	hi Include	ctermfg=219
	hi Define	ctermfg=170
	hi Macro	ctermfg=183
	hi PreCondit	ctermfg=181
	hi Type		ctermfg=34
	hi StorageClass	ctermfg=36
	hi Structure	ctermfg=71
	hi Typedef	ctermfg=106

	hi mailQuoted1	ctermfg=189
	hi mailQuoted2	ctermfg=147
	hi mailQuoted3	ctermfg=105
	hi mailQuoted4	ctermfg=63
	hi mailQuoted5	ctermfg=21
	hi mailQuoted6	ctermfg=20
	hi mailHeaderKey ctermfg=157
	hi mailHeaderEmail ctermfg=225
	hi mailEmail	ctermfg=141
endif
