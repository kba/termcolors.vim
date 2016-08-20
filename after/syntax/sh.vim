call termcolors#syn('sh', 'fg', 'match', "/\\[\\([0-9\]\\{1,2\\};\\)\\?\\zs38;5;__TERMCOLOR__\\zem\\?\\>/ containedin=ALL")
call termcolors#syn('sh', 'bg', 'match', "/\\[\\([0-9\]\\{1,2\\};\\)\\?\\zs48;5;__TERMCOLOR__\\zem\\?\\>/ containedin=ALL")
call termcolors#syn('sh', 'fg', 'match', "/\\[\\([0-9\];\\)\\?\\zs3__TERMCOLOR__\\zem/ containedin=ALL")
call termcolors#syn('sh', 'bg', 'match', "/\\[\\([0-9\];\\)\\?\\zs4__TERMCOLOR__\\zem/ containedin=ALL")
