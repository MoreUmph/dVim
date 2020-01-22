" DENIZEN PLUGIN
" --------------
fun Denizen()
    if !exists("g:denizen_created")
        let g:denizen_created = 1
        call CreateDenizen()
    else
        call OpenDenizen()
    endif
endfun




fun CreateDenizen()
    if &readonly
        let b:read_only = 1
        set readonly!
    endif

    if empty(glob("$VIM/vim82/ftplugin/dsc.vim"))
	echom "Creating Denizen plugin..."
        call CreateDenizenPlugin()
    endif

    if empty(glob("$VIM/vim82/colors/dsc.vim"))
	echom "Creating Denizen colors..."
	call CreateDenizenColors()
    endif

    if empty(glob("$VIM/vim82/syntax/dsc.vim"))
	echom "Creating Denizen syntax..."
	call CreateDenizenSyntax()
    endif

    if exists("b:read_only")
	let b:read_only = 0
        set readonly
    endif
endfun


fun CreateDenizenPlugin()
    call append('$', "if exists('b:dsc_plugin')")
    call append('$', "    finish")
    call append('$', "endif")
    call append('$', "let b:dsc_plugin = 1")
    call append('$', "")
    call append('$', "set number")
    call append('$', "set expandtab")
    call append('$', "set norwap")
    call append('$', "set syntax=dsc")
    call append('$', "color dsc")
    call append('$', "")
    call append('$', "inoremap < <><esc>i")
    call append('$', "inoremap [ []<esc>i")
    call append('$', "inoremap ( ()<esc>i")
    call append('$', "inoremap \" \"\"<esc>i")
    call append('$', "inoremap ' ''<esc>i")
    call append('$', "inoremap { <esc><i")
    call append('$', "inoremap } <esc>>i")
    call append('$', "")
    call append('$', "if !exists('$TMUX')")
    call append('$', "    set tabstop=4")
    call append('$', "    set shiftwidth=4")
    call append('$', "    inoremap <c-c> y")
    call append('$', "    inoremap <c-v> p")
    call append('$', "    inoremap <M-up> <esc>ddkPa")
    call append('$', "    inoremap <M-down> <esc>ddkPa")
    call append('$', "    inoremap <s-space> <esc>ea")
    call append('$', "    inoremap <s-backspace> <esc>ba")
    call append('$', "    inoremap <c-space> <esc>Ea")
    call append('$', "    inoremap <c-backspace> <esc>Ba")
    call append('$', "else")
    call append('$', "    set tabstop=2")
    call append('$', "    set shiftwidth=2")
    call append('$', "endif")
endfun


fun CreateDenizenColors()
    call append('$', "if exists('syntax_on')")
    call append('$', "    syntax reset")
    call append('$', "endif")
    call append('$', "let g:colors_name = 'dsc'")
    call append('$', "")
    call append('$', "hi Normal  guifg=lightgrey  guibg=slate  gui=none ctermfg=white  ctermbg=black  cterm=none")
endfun


fun CreateDenizenSyntax()
    edit $VIM/vim82/syntax/denizen.vim
    call append('$', "if exists('b:current_syntax')")
    call append('$', "    finish")
    call append('$', "endif")
    call append('$', "let b:current_syntax = 'dsc'")
    call append('$', "")
    call append('$', "syn match dComment1 '\\v#.*$'     contains=dComment2,dComment3")
    call append('$', "syn match dComment2 '\\v#.*#.*$'  contained")
    call append('$', "syn match dComment3 '\\v#.*\-.*$' contained")
    call append('$', "syn match dScript   '\\v^\w*:$'")
    write
endfun




fun OpenDenizen()
    if &readonly
        let b:read_only = 1
        set readonly!
    endif

    split $VIM/vim82/syntax/dsc.vim
    vsplit $VIM/vim82/colors/dsc.vim
    vsplit $VIM/vim82/ftplugin/dsc.vim
    
    if exists("b:read_only")
        set readonly
        let b:read_only = 0
    endif
endfun
