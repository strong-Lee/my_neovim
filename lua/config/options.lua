-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua

-- 设置 leader 键为空格。虽然 LazyVim 默认就是空格，但在这里明确写出来有助于理解。
-- Leader 键是所有自定义快捷键的前缀，非常重要。
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- 获取 vim.opt 的引用，方便后续书写
local opt = vim.opt

-- ===================================================================
-- 外观与界面 (UI & Appearance)
-- ===================================================================

-- 显示相对行号和当前行的绝对行号，这是 Vim 高效移动的基础。
opt.relativenumber = true -- 显示相对行号
opt.number = true -- 显示绝对行号

-- 设置光标行高亮，让你时刻清楚光标位置。
opt.cursorline = true

-- 在窗口底部和顶部分别保留 8 行的上下文空间，滚动时视野更开阔。
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 增强 diff 模式的可读性
opt.fillchars:append({ diff = "╱" })

-- 确保 Markdown 渲染生效
opt.conceallevel = 2

-- ===================================================================
-- 编辑与行为 (Editing & Behavior)
-- ===================================================================

-- 设置缩进。大部分现代项目使用 2 个空格作为缩进。
opt.tabstop = 2 -- Tab 键代表的空格数
opt.softtabstop = 2 -- 执行 Tab 操作时，移动的空格数
opt.shiftwidth = 2 -- 自动缩进和 > < 命令使用的空格数
opt.expandtab = true -- 将 Tab 转换为空格
opt.smartindent = true -- 开启智能缩进

-- 禁用自动换行。对于代码来说，通常不换行更易读。
opt.wrap = false

-- ===================================================================
-- 搜索 (Searching)
-- ===================================================================

-- 搜索时忽略大小写
opt.ignorecase = true
-- 但如果搜索词中包含大写字母，则切换为大小写敏感搜索
opt.smartcase = true

-- ===================================================================
-- 其他
-- ===================================================================

-- 减少更新时间，可以让某些插件（如 git-signs）响应更快。
opt.updatetime = 250

-- 在键入命令时，更早地触发 which-key 快捷键提示，默认是 1000ms。
opt.timeoutlen = 300
