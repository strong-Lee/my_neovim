-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ~/.config/nvim/lua/config/keymaps.lua

-- 这是一个很好的习惯，先获取 set 函数的本地引用。
local map = vim.keymap.set

-- ===================================================================
-- 窗口管理 (Window Management)
-- ===================================================================
-- 使用 <leader> + v/s 进行分屏，更符合 Vim 的直觉。
-- 'v' for vertical split, 's' for horizontal split.
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Split Window Vertically" })
map("n", "<leader>s", "<cmd>split<cr>", { desc = "Split Window Horizontally" })

-- ===================================================================
-- 缓冲区管理 (Buffer Management)
-- ===================================================================
-- 使用 Ctrl + 左右方向键在缓冲区之间快速切换。
map("n", "<C-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-Left>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- 使用 <leader>q 关闭当前缓冲区，比默认的 <leader>bd 更快。
map("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Close Buffer" })

-- Telescope Project
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Switch Project" })
-- ===================================================================
-- 终端 (Terminal)
-- ===================================================================
-- <leader>t 打开浮动终端
map("n", "<leader>t", function()
  -- LazyVim 提供了一个很棒的终端工具
  require("lazyvim.util").terminal(nil, { border = "rounded" })
end, { desc = "Toggle Floating Terminal" })

-- 在终端模式下，按 <esc><esc> 退出终端模式返回普通模式
map("t", "<esc><esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- ===================================================================
-- 视觉模式增强 (Visual Mode Enhancements)
-- ===================================================================
-- 在视觉模式下，按 > 或 < 缩进后，仍然保持选中状态，方便连续缩进。
map("v", "<", "<gv", { desc = "Indent Left (Keep Selection)" })
map("v", ">", ">gv", { desc = "Indent Right (Keep Selection)" })

-- ===================================================================
-- 移动选中的代码块 (Moving Code Blocks)
-- ===================================================================
-- 使用 Alt + j/k (在 Mac 上是 Option + j/k) 在视觉模式下上下移动选中的代码行。
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
