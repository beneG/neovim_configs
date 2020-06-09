if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Consolas NF:14:1



    " Use shift+insert for paste inside neovim-qt,
    " see https://github.com/equalsraf/neovim-qt/issues/327#issuecomment-325660764
    "inoremap <silent> <S-Insert> <C-R>+
    "cnoremap <silent> <S-Insert> <C-R>+

    inoremap <S-Insert> <C-R>+
    cnoremap <S-Insert> <C-R>+

    " For Windows, Ctrl-6 does not work. So we use this mapping instead.
    nnoremap <silent> <C-6> <C-^>


    " set bg=light
endif
