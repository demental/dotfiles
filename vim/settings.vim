let vimsettings = '~/.vim/settings'
let uname = system('uname -s')

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . '/yadr-keymap-mac.vim') && uname[:4] ==? 'linux'
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . '/yadr-keymap-linux.vim') && uname[:4] !=? 'linux'
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor

" Visual
set wrap
set relativenumber

set listchars=tab:\ ·
set listchars+=trail:·
set listchars+=extends:»,precedes:«

" case-insensitive
command W :w|e
command Q q

" Toggle NERDTree
nnoremap <silent> <leader>` :NERDTreeToggle<CR>

" Switch to previous file
nnoremap <leader><tab> :b#<cr>

if has('nvim')
  " While in a terminal use esc to drop into normal mode
  tnoremap <esc> <c-\><c-n>
end

" Display and store directories
noremap <Leader>k1 :let @* = @%<CR>
noremap <Leader>k2 :let @* = getcwd() . '/' . @%<CR>
noremap <leader>l1 :echo @%<CR>
noremap <leader>l2 :echo getcwd() . '/' . @%<CR>

"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

noremap <leader>qn :cn<CR>
noremap <leader>qp :cp<CR>

