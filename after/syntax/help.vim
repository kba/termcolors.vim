syn match helptermcolorFg /fg \{0,2\}\([0-9]\{1,3\}\)/ containedin=ALL contains=helptermcolorFgBg
syn match helptermcolorBg /bg \{0,2\}\([0-9]\{1,3\}\)/ containedin=ALL contains=helptermcolorFgBg
syn match helptermcolorFgBg /[fb]g/ contained conceal
call termcolors#syn('help', 'fg', 'match', '/ *__TERMCOLOR__\ze\(\>\|[^0-9]\)/ containedin=helptermcolorFg contained')
call termcolors#syn('help', 'bg', 'match', '/ *__TERMCOLOR__\ze\(\>\|[^0-9]\)/ containedin=helptermcolorBg contained')
