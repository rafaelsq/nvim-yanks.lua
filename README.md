# nvim-yanks.lua
`nvim-yanks` is a clipboard manager neovim plugin with [fzf.vim](https://github.com/junegunn/fzf) integration.
It records everything that get yanked in your vim session so that you can recover it easy.

## Setup

```
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rafaelsq/nvim-yanks.lua'
...

require'nvim-yanks'.setup()
vim.api.nvim_set_keymap('n', '<Leader>y', ':lua require("nvim-yanks").Show()<CR>', {silent=true})
```

