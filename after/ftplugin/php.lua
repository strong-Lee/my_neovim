-- ~/.config/nvim/after/ftplugin/php.lua

-- 这里的设置只会对 PHP 文件生效
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

print("PHP ftplugin loaded: Indent set to 4 spaces.") -- (可选) 这是一个调试信息，确认文件被加载了。配置好后可以删除。
