local M = {}

local store = {}

M.store = function()
  table.insert(store, 1, vim.v.event)
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
  local source = {}
  for i, o in pairs(store) do
    table.insert(source, i .. '\t' .. table.concat(o.regcontents, "\n"))
  end

  local w = vim.fn["fzf#wrap"]('Yanks', {
    source = source,
  })
  w["sink*"] = function(line)
    local o = store[tonumber(string.gmatch(line[2], '%d+')())]
    vim.fn.setreg(vim.v.register, table.concat(o.regcontents, "\n"), o.regtype)
  end
  vim.fn["fzf#run"](w)
end

M.setup = function(opts)
  setup()
end

return M
