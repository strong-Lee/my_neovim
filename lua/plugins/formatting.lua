-- ~/.config/nvim/lua/plugins/formatting.lua

return {
  "stevearc/conform.nvim",
  opts = {
    -- 指定不同文件类型的格式化器
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "php-cs-fixer" }, -- php 文件指定 php-cs-fixer
      blade = { "blade-formatter" },
      -- ... 其他文件类型的配置
    },
  },
}
