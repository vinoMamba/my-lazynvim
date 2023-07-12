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
map({ "v", "n" }, "S", "<cmd>w<cr><esc>", { desc = "Save file", noremap = true })
map({ "n" }, "Q", "<cmd>q<cr><esc>", { desc = "Quit", noremap = true })

map({ "n", "v" }, "K", "5k", { desc = "move up 5 lines", noremap = true })
map({ "n", "v" }, "J", "5j", { desc = "move down 5 lines", noremap = true })
map({ "n", "v" }, "L", "$", { desc = "move down 5 lines", noremap = true })
map({ "n", "v" }, "H", "^", { desc = "move down 5 lines", noremap = true })

map("n", "-", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "=", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- window split
map("n", "sl", "<cmd>:set nosplitright<CR>:vsplit<CR>:set splitright<CR>", { desc = "split to right" })
map("n", "sj", "<cmd>:set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", { desc = "split to bottom" })
map("n", "<down>", "<cmd>:res +5<CR>", { desc = "resize up" })
map("n", "<up>", "<cmd>:res -5<CR>", { desc = "resize up" })
map("n", "<left>", "<cmd>:vertical resize-5<CR>", { desc = "resize up" })
map("n", "<right>", "<cmd>:vertical resize+5<CR>", { desc = "resize up" })
