" Language:     Colorful Terminal Colors Preview
" Author:       Konstantin Baierer <konstantin.baierer@gmail.com>
" Licence:      The MIT License (MIT)
"
" This highlights ctermfg/ctermbg colors with the number they represent

if v:version < 700 || !( has('syntax') || has('gui_running') || has('nvim') || &t_Co==256 )
	function! termcolors#init()
	endfunction
	function! termcolors#syn()
	endfunction
	finish
endif

"{{{ Global Variables
"
"{{{ Syntax Group prefix
if !exists("g:termcolors_syntax_prefix")
    let g:termcolors_syntax_prefix = 'termColor'
endif
"}}}

"{{{ Foreground colors
if !exists("g:termcolors_fg")
    let g:termcolors_fg = 'ctermfg=__TERMCOLOR__'
endif

if !exists("g:termcolors_fg_light")
    let g:termcolors_fg_light = 'ctermfg=__TERMCOLOR__ ctermbg=232'
endif

if !exists("g:termcolors_fg_dark")
    let g:termcolors_fg_dark = 'ctermfg=__TERMCOLOR__ ctermbg=252'
endif

"}}}

"{{{ Background colors
if !exists("g:termcolors_bg")
    let g:termcolors_bg = 'ctermbg=__TERMCOLOR__'
endif

if !exists("g:termcolors_bg_light")
    let g:termcolors_bg_light = 'cterm=reverse ctermbg=NONE ctermfg=__TERMCOLOR__'
endif

if !exists("g:termcolors_bg_dark")
    let g:termcolors_bg_dark = 'cterm=reverse ctermbg=NONE ctermfg=__TERMCOLOR__'
endif
"}}}

"{{{ Syntax matching
if !exists("g:termcolors_syn_cmd")
    let g:termcolors_syn_cmd = 'keyword'
endif

if !exists("g:termcolors_syn_body")
    let g:termcolors_syn_body = '__TERMCOLOR__ containedin=ALL'
endif
"}}}
"}}}

"{{{ Color mapping
" Source for colors: https://gist.github.com/MicahElliott/719710
let s:rgb256list = {}
" Primary 3-bit (8 colors). Unique representation!
let s:rgb256list[0] = ['000000', 'dark']
let s:rgb256list[1] = ['800000', 'light']
let s:rgb256list[2] = ['008000', 'light']
let s:rgb256list[3] = ['808000', 'light']
let s:rgb256list[4] = ['000080', '']
let s:rgb256list[5] = ['800080', '']
let s:rgb256list[6] = ['008080', 'light']
let s:rgb256list[7] = ['c0c0c0', 'light']

" Equivalent "bright" versions of original 8 colors.
let s:rgb256list[8] = ['808080', 'dark']
let s:rgb256list[9] = ['ff0000', '']
let s:rgb256list[10] = ['00ff00', 'light']
let s:rgb256list[11] = ['ffff00', 'light']
let s:rgb256list[12] = ['0000ff', 'light']
let s:rgb256list[13] = ['ff00ff', 'light']
let s:rgb256list[14] = ['00ffff', 'light']
let s:rgb256list[15] = ['ffffff', 'light']

" Strictly ascending.
let s:rgb256list[16] = ['000000', 'dark']
let s:rgb256list[17] = ['00005f', 'dark']
let s:rgb256list[18] = ['000087', 'dark']
let s:rgb256list[19] = ['0000af', 'dark']
let s:rgb256list[20] = ['0000d7', '']
let s:rgb256list[21] = ['0000ff', 'dark']
let s:rgb256list[22] = ['005f00', 'dark']
let s:rgb256list[23] = ['005f5f', 'dark']
let s:rgb256list[24] = ['005f87', 'dark']
let s:rgb256list[25] = ['005faf', 'light']
let s:rgb256list[26] = ['005fd7', 'light']
let s:rgb256list[27] = ['005fff', 'dark']
let s:rgb256list[28] = ['008700', 'dark']
let s:rgb256list[29] = ['00875f', 'dark']
let s:rgb256list[30] = ['008787', 'dark']
let s:rgb256list[31] = ['0087af', 'light']
let s:rgb256list[32] = ['0087d7', 'light']
let s:rgb256list[33] = ['0087ff', 'light']
let s:rgb256list[34] = ['00af00', 'light']
let s:rgb256list[35] = ['00af5f', 'light']
let s:rgb256list[36] = ['00af87', 'light']
let s:rgb256list[37] = ['00afaf', 'light']
let s:rgb256list[38] = ['00afd7', 'light']
let s:rgb256list[39] = ['00afff', 'light']
let s:rgb256list[40] = ['00d700', 'light']
let s:rgb256list[41] = ['00d75f', 'light']
let s:rgb256list[42] = ['00d787', 'light']
let s:rgb256list[43] = ['00d7af', 'light']
let s:rgb256list[44] = ['00d7d7', 'light']
let s:rgb256list[45] = ['00d7ff', 'light']
let s:rgb256list[46] = ['00ff00', 'light']
let s:rgb256list[47] = ['00ff5f', 'light']
let s:rgb256list[48] = ['00ff87', 'light']
let s:rgb256list[49] = ['00ffaf', 'light']
let s:rgb256list[50] = ['00ffd7', 'light']
let s:rgb256list[51] = ['00ffff', 'light']
let s:rgb256list[52] = ['5f0000', 'dark']
let s:rgb256list[53] = ['5f005f', 'dark']
let s:rgb256list[54] = ['5f0087', 'dark']
let s:rgb256list[55] = ['5f00af', 'dark']
let s:rgb256list[56] = ['5f00d7', '']
let s:rgb256list[57] = ['5f00ff', '']
let s:rgb256list[58] = ['5f5f00', 'dark']
let s:rgb256list[59] = ['5f5f5f', '']
let s:rgb256list[60] = ['5f5f87', '']
let s:rgb256list[61] = ['5f5faf', '']
let s:rgb256list[62] = ['5f5fd7', 'light']
let s:rgb256list[63] = ['5f5fff', 'light']
let s:rgb256list[64] = ['5f8700', '']
let s:rgb256list[65] = ['5f875f', '']
let s:rgb256list[66] = ['5f8787', '']
let s:rgb256list[67] = ['5f87af', 'light']
let s:rgb256list[68] = ['5f87d7', 'light']
let s:rgb256list[69] = ['5f87ff', 'light']
let s:rgb256list[70] = ['5faf00', 'light']
let s:rgb256list[71] = ['5faf5f', 'light']
let s:rgb256list[72] = ['5faf87', 'light']
let s:rgb256list[73] = ['5fafaf', 'light']
let s:rgb256list[74] = ['5fafd7', 'light']
let s:rgb256list[75] = ['5fafff', 'light']
let s:rgb256list[76] = ['5fd700', 'light']
let s:rgb256list[77] = ['5fd75f', 'light']
let s:rgb256list[78] = ['5fd787', 'light']
let s:rgb256list[79] = ['5fd7af', 'light']
let s:rgb256list[80] = ['5fd7d7', 'light']
let s:rgb256list[81] = ['5fd7ff', 'light']
let s:rgb256list[82] = ['5fff00', 'light']
let s:rgb256list[83] = ['5fff5f', 'light']
let s:rgb256list[84] = ['5fff87', 'light']
let s:rgb256list[85] = ['5fffaf', 'light']
let s:rgb256list[86] = ['5fffd7', 'light']
let s:rgb256list[87] = ['5fffff', 'light']
let s:rgb256list[88] = ['870000', 'dark']
let s:rgb256list[89] = ['87005f', '']
let s:rgb256list[90] = ['870087', '']
let s:rgb256list[91] = ['8700af', '']
let s:rgb256list[92] = ['8700d7', '']
let s:rgb256list[93] = ['8700ff', '']
let s:rgb256list[94] = ['875f00', '']
let s:rgb256list[95] = ['875f5f', '']
let s:rgb256list[96] = ['875f87', '']
let s:rgb256list[97] = ['875faf', '']
let s:rgb256list[98] = ['875fd7', '']
let s:rgb256list[99] = ['875fff', 'light']
let s:rgb256list[100] = ['878700', 'light']
let s:rgb256list[101] = ['87875f', 'light']
let s:rgb256list[102] = ['878787', 'light']
let s:rgb256list[103] = ['8787af', 'light']
let s:rgb256list[104] = ['8787d7', 'light']
let s:rgb256list[105] = ['8787ff', 'light']
let s:rgb256list[106] = ['87af00', 'light']
let s:rgb256list[107] = ['87af5f', 'light']
let s:rgb256list[108] = ['87af87', 'light']
let s:rgb256list[109] = ['87afaf', 'light']
let s:rgb256list[110] = ['87afd7', 'light']
let s:rgb256list[111] = ['87afff', 'light']
let s:rgb256list[112] = ['87d700', 'light']
let s:rgb256list[113] = ['87d75f', 'light']
let s:rgb256list[114] = ['87d787', 'light']
let s:rgb256list[115] = ['87d7af', 'light']
let s:rgb256list[116] = ['87d7d7', 'light']
let s:rgb256list[117] = ['87d7ff', 'light']
let s:rgb256list[118] = ['87ff00', 'light']
let s:rgb256list[119] = ['87ff5f', 'light']
let s:rgb256list[120] = ['87ff87', 'light']
let s:rgb256list[121] = ['87ffaf', 'light']
let s:rgb256list[122] = ['87ffd7', 'light']
let s:rgb256list[123] = ['87ffff', 'light']
let s:rgb256list[124] = ['af0000', 'dark']
let s:rgb256list[125] = ['af005f', '']
let s:rgb256list[126] = ['af0087', '']
let s:rgb256list[127] = ['af00af', '']
let s:rgb256list[128] = ['af00d7', '']
let s:rgb256list[129] = ['af00ff', 'light']
let s:rgb256list[130] = ['af5f00', '']
let s:rgb256list[131] = ['af5f5f', '']
let s:rgb256list[132] = ['af5f87', '']
let s:rgb256list[133] = ['af5faf', '']
let s:rgb256list[134] = ['af5fd7', '']
let s:rgb256list[135] = ['af5fff', '']
let s:rgb256list[136] = ['af8700', '']
let s:rgb256list[137] = ['af875f', '']
let s:rgb256list[138] = ['af8787', 'light']
let s:rgb256list[139] = ['af87af', 'light']
let s:rgb256list[140] = ['af87d7', 'light']
let s:rgb256list[141] = ['af87ff', 'light']
let s:rgb256list[142] = ['afaf00', 'light']
let s:rgb256list[143] = ['afaf5f', 'light']
let s:rgb256list[144] = ['afaf87', 'light']
let s:rgb256list[145] = ['afafaf', 'light']
let s:rgb256list[146] = ['afafd7', 'light']
let s:rgb256list[147] = ['afafff', 'light']
let s:rgb256list[148] = ['afd700', 'light']
let s:rgb256list[149] = ['afd75f', 'light']
let s:rgb256list[150] = ['afd787', 'light']
let s:rgb256list[151] = ['afd7af', 'light']
let s:rgb256list[152] = ['afd7d7', 'light']
let s:rgb256list[153] = ['afd7ff', 'light']
let s:rgb256list[154] = ['afff00', 'light']
let s:rgb256list[155] = ['afff5f', 'light']
let s:rgb256list[156] = ['afff87', 'light']
let s:rgb256list[157] = ['afffaf', 'light']
let s:rgb256list[158] = ['afffd7', 'light']
let s:rgb256list[159] = ['afffff', 'light']
let s:rgb256list[160] = ['d70000', '']
let s:rgb256list[161] = ['d7005f', '']
let s:rgb256list[162] = ['d70087', '']
let s:rgb256list[163] = ['d700af', '']
let s:rgb256list[164] = ['d700d7', '']
let s:rgb256list[165] = ['d700ff', '']
let s:rgb256list[166] = ['d75f00', '']
let s:rgb256list[167] = ['d75f5f', '']
let s:rgb256list[168] = ['d75f87', '']
let s:rgb256list[169] = ['d75faf', '']
let s:rgb256list[170] = ['d75fd7', '']
let s:rgb256list[171] = ['d75fff', 'light']
let s:rgb256list[172] = ['d78700', 'light']
let s:rgb256list[173] = ['d7875f', 'light']
let s:rgb256list[174] = ['d78787', 'light']
let s:rgb256list[175] = ['d787af', 'light']
let s:rgb256list[176] = ['d787d7', 'light']
let s:rgb256list[177] = ['d787ff', 'light']
let s:rgb256list[178] = ['d7af00', 'light']
let s:rgb256list[179] = ['d7af5f', 'light']
let s:rgb256list[180] = ['d7af87', 'light']
let s:rgb256list[181] = ['d7afaf', 'light']
let s:rgb256list[182] = ['d7afd7', 'light']
let s:rgb256list[183] = ['d7afff', 'light']
let s:rgb256list[184] = ['d7d700', 'light']
let s:rgb256list[185] = ['d7d75f', 'light']
let s:rgb256list[186] = ['d7d787', 'light']
let s:rgb256list[187] = ['d7d7af', 'light']
let s:rgb256list[188] = ['d7d7d7', 'light']
let s:rgb256list[189] = ['d7d7ff', 'light']
let s:rgb256list[190] = ['d7ff00', 'light']
let s:rgb256list[191] = ['d7ff5f', 'light']
let s:rgb256list[192] = ['d7ff87', 'light']
let s:rgb256list[193] = ['d7ffaf', 'light']
let s:rgb256list[194] = ['d7ffd7', 'light']
let s:rgb256list[195] = ['d7ffff', 'light']
let s:rgb256list[196] = ['ff0000', 'dark']
let s:rgb256list[197] = ['ff005f', '']
let s:rgb256list[198] = ['ff0087', '']
let s:rgb256list[199] = ['ff00af', '']
let s:rgb256list[200] = ['ff00d7', 'light']
let s:rgb256list[201] = ['ff00ff', 'light']
let s:rgb256list[202] = ['ff5f00', 'light']
let s:rgb256list[203] = ['ff5f5f', 'light']
let s:rgb256list[204] = ['ff5f87', 'light']
let s:rgb256list[205] = ['ff5faf', 'light']
let s:rgb256list[206] = ['ff5fd7', 'light']
let s:rgb256list[207] = ['ff5fff', 'light']
let s:rgb256list[208] = ['ff8700', 'light']
let s:rgb256list[209] = ['ff875f', 'light']
let s:rgb256list[210] = ['ff8787', 'light']
let s:rgb256list[211] = ['ff87af', 'light']
let s:rgb256list[212] = ['ff87d7', 'light']
let s:rgb256list[213] = ['ff87ff', 'light']
let s:rgb256list[214] = ['ffaf00', 'light']
let s:rgb256list[215] = ['ffaf5f', 'light']
let s:rgb256list[216] = ['ffaf87', 'light']
let s:rgb256list[217] = ['ffafaf', 'light']
let s:rgb256list[218] = ['ffafd7', 'light']
let s:rgb256list[219] = ['ffafff', 'light']
let s:rgb256list[220] = ['ffd700', 'light']
let s:rgb256list[221] = ['ffd75f', 'light']
let s:rgb256list[222] = ['ffd787', 'light']
let s:rgb256list[223] = ['ffd7af', 'light']
let s:rgb256list[224] = ['ffd7d7', 'light']
let s:rgb256list[225] = ['ffd7ff', 'light']
let s:rgb256list[226] = ['ffff00', 'light']
let s:rgb256list[227] = ['ffff5f', 'light']
let s:rgb256list[228] = ['ffff87', 'light']
let s:rgb256list[229] = ['ffffaf', 'light']
let s:rgb256list[230] = ['ffffd7', 'light']
let s:rgb256list[231] = ['ffffff', 'light']

" Gray-scale range.
let s:rgb256list[232] = ['080808', 'dark']
let s:rgb256list[233] = ['121212', 'dark']
let s:rgb256list[234] = ['1c1c1c', 'dark']
let s:rgb256list[235] = ['262626', 'dark']
let s:rgb256list[236] = ['303030', 'dark']
let s:rgb256list[237] = ['3a3a3a', 'dark']
let s:rgb256list[238] = ['444444', 'dark']
let s:rgb256list[239] = ['4e4e4e', 'dark']
let s:rgb256list[240] = ['585858', 'dark']
let s:rgb256list[241] = ['626262', 'dark']
let s:rgb256list[242] = ['6c6c6c', 'light']
let s:rgb256list[243] = ['767676', 'light']
let s:rgb256list[244] = ['808080', 'light']
let s:rgb256list[245] = ['8a8a8a', 'light']
let s:rgb256list[246] = ['949494', 'light']
let s:rgb256list[247] = ['9e9e9e', 'light']
let s:rgb256list[248] = ['a8a8a8', 'light']
let s:rgb256list[249] = ['b2b2b2', 'light']
let s:rgb256list[250] = ['bcbcbc', 'light']
let s:rgb256list[251] = ['c6c6c6', 'light']
let s:rgb256list[252] = ['d0d0d0', 'light']
let s:rgb256list[253] = ['dadada', 'light']
let s:rgb256list[254] = ['e4e4e4', 'light']
let s:rgb256list[255] = ['eeeeee', 'light']
"}}}

function! s:groupname(i)
    return g:termcolors_syntax_prefix . a:i
endfunction

function! s:render(tpl, ids)
    let l:cmds = []
    let l:ids = a:ids
    for i in l:ids
        let l:cmd = a:tpl
        let l:cmd = substitute(l:cmd, '__NAME__', s:groupname(i), "g")
        let l:cmd = substitute(l:cmd, '__TERMCOLOR__', i, "g")
        let l:cmd = substitute(l:cmd, '__GUICOLOR__', '#' . s:rgb256list[i][0], "g")
        call add(l:cmds, l:cmd)
    endfor
    return join(l:cmds, ' | ')
endfunction

function! termcolors#syn(ft, fgbg, ...)
    call termcolors#init()
    if a:0 == 2
        let l:synCmdName = a:1
        let l:synCmdBody = a:2
    else
        let l:synCmdName = g:termcolors_syn_cmd
        let l:synCmdBody = g:termcolors_syn_body
    endif
    let l:name = '__NAME__' . a:fgbg
    let l:synCmd = 'syn ' . l:synCmdName . ' ' . a:ft . l:name . ' ' . l:synCmdBody
    " echo l:synCmd
    exec s:render(l:synCmd, keys(s:rgb256list))
    let l:hiLinkCmd = 'hi link ' . a:ft . l:name . ' ' . l:name
    exec s:render(l:hiLinkCmd, keys(s:rgb256list))
endfunction

function! termcolors#init()
    if exists("g:termcolors_initialized")
        return
    endif
    for i in keys(s:rgb256list)
        exe s:render("hi " . s:groupname(i) . "bg " . g:termcolors_bg, [i])
        for fgbg in ['fg', 'bg']
            let l:name = s:groupname(i) . fgbg
            if fgbg == 'fg' && s:rgb256list[i][1] == &background
                exe s:render("hi " . l:name . ' ' . g:termcolors_{fgbg}_{&background}, [i])
            elseif fgbg == 'bg' && s:rgb256list[i][1] == 'light' && &background == 'dark'
                exe s:render("hi " . l:name . ' ' . g:termcolors_{fgbg}_light, [i])
            elseif fgbg == 'bg' && s:rgb256list[i][1] == 'dark' && &background == 'light'
                exe s:render("hi " . l:name . ' ' . g:termcolors_{fgbg}_dark, [i])
            else
                exe s:render("hi " . l:name . ' ' . g:termcolors_{fgbg}, [i])
            endif
        endfor
    endfor
    let g:termcolors_initialized = 1
    augroup termcolors
        au ColorScheme * call termcolors#reinit()
    augroup END
endfunction

function! termcolors#reinit()
    silent unlet g:termcolors_initialized
    augroup! termcolors
    call termcolors#init()
endfunction
