-- ~/.config/nvim/lua/plugins/lsp-php.lua
return {
  -- ★ 核心：启用 LazyVim 的 PHP 模块
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- 确保 opts.extras 存在且是 table
      opts.extras = opts.extras or {}
      -- 安全地添加 PHP 支持
      vim.list_extend(opts.extras, {
        "lang.php",
      })
    end,
  },
  -- ★ 确保 PHP 工具由 Mason 自动安装
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- 添加安全初始化
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "intelephense", -- PHP 的 LSP 服务器
        "php-cs-fixer", -- PHP 的代码格式化器
        "phpstan", -- 建议添加：静态分析
        -- "psalm", -- 建议添加：类型检查, php版本大于8.1
        "php-debug-adapter", -- 调试支持
        "blade-formatter", -- Laravel Blade 支持
      })
    end,
  },
  -- ★ PHP 专用增强
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
    },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension("laravel")
    end,
  },
}
