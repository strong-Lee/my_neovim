-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- 创建一个自动命令组，用于管理我们自定义的命令，防止重复加载
local augroup = vim.api.nvim_create_augroup("custom_cursor_pos", { clear = true })

-- 创建自动命令
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  pattern = "*", -- 对所有文件生效
  desc = "Restore cursor to last known position", -- 命令的描述
  callback = function()
    -- vim.fn.line("'\"") 获取上次记录的光标行号
    -- vim.fn.line("$") 获取当前文件的总行数
    local last_pos_line = vim.fn.line("'\"")

    -- 检查上次记录的行号是否在 1 和文件总行数之间
    -- 这是关键的保护逻辑，防止跳转到不存在的行
    if last_pos_line > 1 and last_pos_line <= vim.fn.line("$") then
      -- 使用 pcall 包装，即使出错也不会中断执行
      pcall(vim.cmd, 'normal! g`"')
    end
  end,
})
