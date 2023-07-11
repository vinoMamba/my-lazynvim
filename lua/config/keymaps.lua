local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- basic
map({ "i" }, "jk", "<Esc>", { desc = "Quit Insert Mode", noremap = true }) -- buffers
map({ "v", "n", "s" }, "S", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "n" }, "Q", "<cmd>q<cr><esc>", { desc = "Quit" })

map({ "n" }, "K", "5k", { desc = "Quit" })
map({ "n" }, "J", "5j", { desc = "Quit", noremap = true })

map("n", "-", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "=", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
