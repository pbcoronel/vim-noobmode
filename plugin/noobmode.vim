let g:NoobModeStatus = 0
let g:PreviousColorScheme = g:colors_name
let g:DisabledKeysMessage = "The arrow keys are disabled!"

function! NoobMode()
  if g:NoobModeStatus == 1
    noremap <up> <up>
    noremap <down> <down>
    noremap <left> <left>
    noremap <right> <right>
    inoremap <up> <up>
    inoremap <down> <down>
    inoremap <left> <left>
    inoremap <right> <right>
    autocmd! ChangeStatusLineOnMode InsertEnter *
    autocmd! ChangeStatusLineOnMode InsertLeave *
    exe "colorscheme "g:PreviousColorScheme
    let g:NoobModeStatus = 0
    echo "NoobMode is off."
  else
    let g:PreviousColorScheme = g:colors_name
    noremap <up> :echoerr g:DisabledKeysMessage<CR>
    noremap <down> :echoerr g:DisabledKeysMessage<CR>
    noremap <left> :echoerr g:DisabledKeysMessage<CR>
    noremap <right> :echoerr g:DisabledKeysMessage<CR>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
    hi StatusLine ctermfg=green
    augroup ChangeStatusLineOnMode
      autocmd InsertEnter * hi StatusLine ctermfg=red
      autocmd InsertLeave * hi StatusLine ctermfg=green
    augroup END
    let g:NoobModeStatus = 1
    echo "NoobMode is on."
  endif
endfunction

command! -nargs=0 NoobMode :call NoobMode()
