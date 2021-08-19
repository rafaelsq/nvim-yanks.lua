local M = {}

local store = {}

M.store = function()
  table.insert(store, 1, table.concat(vim.v.event.regcontents, "\n"))
end

local function setup()
    vim.cmd([[
        augroup yanks
            autocmd!
            autocmd TextYankPost * :lua require("nvim-yanks").store()
        augroup end
    ]])
end

M.Show = function()
  local w = vim.fn["fzf#wrap"]('Yanks', {
    source = store,
    sink = "",
  })
  w["sink*"] = nil
  w.sink = function(line)
    vim.fn.setreg(vim.v.register, line, 'v')
  end
  vim.fn["fzf#run"](w)
end

M.setup = function(opts)
  setup()
end

return M
