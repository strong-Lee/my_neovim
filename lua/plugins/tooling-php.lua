-- ~/.config/nvim/lua/plugins/formatter-php.lua

return {
  {
    -- 配置完后用 Mason 安装了 php-cs-fixer
    "stevearc/conform.nvim",
    -- `opts` 会智能合并到默认配置中
    opts = {
      format_on_save = false, -- 关闭保存时自动格式化
      formatters_by_ft = {
        php = { "php-cs-fixer" },
        -- 你也可以在这里为其他语言添加格式化器
        -- lua = { "stylua" },
        -- python = { "isort", "black" },
      },
    },
  },
  -- PHP-CS-Fixer 配置示例（可选）
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" }, -- 可搭配代码检查
      },
    },
  },
}
