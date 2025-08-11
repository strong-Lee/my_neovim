-- ~/.config/nvim/lua/plugins/formatter-php.lua
return {
  {
    "stevearc/conform.nvim",
    -- 覆盖 conform.nvim 的默认设置
    opts = {
      -- ★ 核心：关闭保存时自动格式化
      format_on_save = false,
      -- ★ 定义格式化器配置
      formatters = {
        ["php-cs-fixer"] = {
          command = "php-cs-fixer",
          args = {
            "--no-interaction",
            "--quiet",
            "fix",
            "$FILENAME",
          },
          cwd = require("conform.util").root_file({ "composer.json", ".php-cs-fixer.php" }),
        },
      },
      -- ★ 文件类型映射
      formatters_by_ft = {
        php = { "php-cs-fixer" },
        -- 你也可以在这里为其他语言添加格式化器
        -- lua = { "stylua" },
      },
    },
  },
  -- ★增强版快捷键配置（直接放在基础键位）
  {
    "LazyVim/LazyVim",
    init = function()
      -- 更安全的格式化函数
      local function safe_format()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].modified then
          vim.notify("⚠️ 保存修改后再格式化", vim.log.levels.WARN)
          return
        end

        require("conform").format({
          async = true,
          lsp_fallback = true,
          timeout_ms = 3000,
        })

        vim.notify("✅ 代码已格式化", vim.log.levels.INFO)
      end
      -- 注册快捷键
      vim.keymap.set({ "n", "v" }, "<leader>cf", safe_format, {
        desc = "格式化代码",
      })
    end,
  },
  -- ★ PHP-CS-Fixer 配置示例（可选）
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpcs" }, -- 可搭配代码检查
      },
    },
  },
}
