let g:awesomeman_colorscheme = "gruvbox"
fun! ColorMyPencils()
    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        le &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
        le &t_8b = "\<Esc>[38;2;%lu;%lu;%lum]"
    endif
    let g:gruvbox_invert_selection='0'

    set background=dark
    if has('nvim')
        call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:awesomeman_colorscheme])
    else
        colorscheme gruvbox
    endif

    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
endfun
call ColorMyPencils()
