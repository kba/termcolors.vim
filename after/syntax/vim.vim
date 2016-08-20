syn match vimtermColorFg /ctermfg=[0-9]\{1,3\}/ containedin=@vimHighlightCluster
syn match vimtermColorBg /ctermbg=[0-9]\{0,3\}/ containedin=@vimHighlightCluster
syn match vimtermColorFgBg /cterm.g/ containedin=vimtermColorFg,vimtermColorBg
hi! link vimtermColorFgBg Type
call termcolors#syn('vim', 'fg', 'match', '/__TERMCOLOR__\>/ containedin=vimtermColorFg')
call termcolors#syn('vim', 'bg', 'match', '/__TERMCOLOR__\>/ containedin=vimtermColorBg')
