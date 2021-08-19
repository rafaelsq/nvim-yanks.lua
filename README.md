# nvim-yanks.lua
`yanks` is a clipboard manager for neovim.  
It records everything that get yanked in your vim session.

## Setup

```
Plug 'rafaelsq/nvim-yanks.lua'
...

require'nvim-yanks'.setup()
vim.api.nvim_set_keymap('n', '<Leader>y', ':lua require("nvim-yanks").Show()<CR>', {silent=true})
```

