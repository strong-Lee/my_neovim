-- ~/.config/nvim/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- 核心：加载 LazyVim 自身及其默认插件
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- 核心：加载你放在 lua/plugins/ 目录下的自定义插件
    { import = "plugins" },
  },
  extras = {
    -- 明确在这里启用 extras, 注意plugins里的插件应该在这里启用
    -- 启用对 PHP 语言的增强支持 (LSP, linter, formatter)
    -- PHP代码开发推荐工作流：intelephense + php-cs-fixer + phpstan
    -- "lazyvim.plugins.extras.lang.php", -- 禁用全家桶，需要单独配置，不然会有冲突
    -- 启用对 Python 语言的增强支持 (LSP, linter, formatter)
    -- "lazyvim.plugins.extras.lang.python", -- 禁用全家桶，需要单独配置，不然会有冲突
    -- 启用对 C/C++ 语言的增强支持
    -- "lazyvim.plugins.extras.lang.clang", -- 如果你需要C/C++，取消此行注释
    -- 启用官方的代码片段 (snippets) 功能包
    -- 这会安装 luasnip 和 friendly-snippets 等插件
    "lazyvim.plugins.extras.lang.luasnip",
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
