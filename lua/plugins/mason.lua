-- ~/.config/nvim/lua/plugins/mason.lua
-- 这个文件现在是所有 Mason 相关配置的唯一来源，更加清晰。

return {
  -- 第一个插件：配置核心的 mason.nvim
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- `ensure_installed` 列表告诉 Mason 应该自动安装哪些工具
      vim.list_extend(opts.ensure_installed or {}, {
        -- PHP语言
        "intelephense", -- PHP 的 LSP 服务器
        "php-cs-fixer", -- PHP 的代码格式化器
        "phpstan", -- 建议添加：静态分析
        -- "psalm", -- 建议添加：类型检查, php版本大于8.1
        -- "php-debug-adapter", -- 调试支持
        -- "blade-formatter", -- Laravel Blade 支持

        -- 前端 / Vue
        "vue-language-server",

        -- Lua语言
        -- "lua-language-server",
        -- "stylua",

        -- Python语言
        -- "pyright",
        -- "black",

        -- Shell脚本支持
        "bash-language-server",
      })
    end,
  },

  -- 第二个插件：禁用 mason-lspconfig.nvim
  -- 我们把它放在这里，因为它的配置与 mason.nvim 密切相关
  {
    "mason-org/mason-lspconfig.nvim",
    -- enabled = false 是 Lazy.nvim 的一个特殊属性，
    -- 用来明确地禁用一个插件，即使其他地方可能把它作为依赖。
    enabled = false,
  },
}
