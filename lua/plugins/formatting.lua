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

      -- (可选但推荐) 配置 php-cs-fixer 使用项目根目录的配置文件
      formatters = {
        ["php-cs-fixer"] = {
          -- 这会让 php-cs-fixer 自动寻找 .php-cs-fixer.dist.php 或 .php-cs-fixer.php
          args = { "fix", "$FILENAME", "--config=.php-cs-fixer.dist.php", "--allow-risky=yes" },
          -- 如果你的配置文件名是 .php-cs-fixer.php，就把上面改成 --config=.php-cs-fixer.php
        },
      },
    },
  },
}
