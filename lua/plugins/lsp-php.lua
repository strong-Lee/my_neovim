-- ~/.config/nvim/lua/plugins/lsp-php.lua

return {
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
}
