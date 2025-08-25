-- ~/.config/nvim/lua/plugins/formatting.lua

return {
  "stevearc/conform.nvim",
  opts = {
    -- 指定不同文件类型的格式化器
    formatters_by_ft = {
      lua = { "stylua" },
      php = { "php-cs-fixer" }, -- php 文件指定 php-cs-fixer
      blade = { "blade-formatter" },
      -- .env 文件通常被识别为 'sh'。通过设置一个空列表，
      -- 我们告诉 conform.nvim 不要为这类文件运行任何格式化器。
      sh = {},
      -- 为保险起见，可以把dotenv和dosini也加上
      dotenv = {},
      dosini = {},
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
