-- ~/.config/nvim/lua/plugins/mason.lua
-- 此文件集中管理 Mason 及其相关插件的配置。
-- 遵循的原则：
-- 1. mason.nvim:      只负责工具的安装和管理。
-- 2. mason-lspconfig: 负责将 Mason 安装的 LSP 服务器桥接到 nvim-lspconfig。
-- 3. nvim-lint:       (可选，但推荐) 负责将 Mason 安装的 Linter 桥接到 nvim-lint。

return {
  -- 1. Mason 核心：作为包管理器
  {
    "mason-org/mason.nvim",
    -- 我们在这里只配置 mason.nvim 本身，不涉及 ensure_installed，
    -- 因为工具的安装应该由使用它们的插件（如 mason-lspconfig）来声明。
    opts = {
      ui = {
        border = "rounded", -- 边框样式为圆角
        icons = {
          package_installed = "✓", -- 已安装
          package_pending = "➜", -- 安装中
          package_uninstalled = "✗", -- 未安装
        },
      },
    },
  },

  -- 2. Mason 与 lspconfig 的桥梁
  {
    "mason-org/mason-lspconfig.nvim",
    -- 确保在 nvim-lspconfig 之前加载
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- 在这里声明需要 Mason 自动安装和管理的 LSP 服务器。
      -- 当 lspconfig 尝试启动这里列出的服务器时，
      -- mason-lspconfig 会确保它们已被安装。
      ensure_installed = {
        -- PHP
        "intelephense", -- 功能强大的 PHP 代码补全、定义跳转和错误检查
        -- 前端 / Vue / TypeScript
        "vue_ls", --Vue 2 官方 LSP，提供模板和脚本的语言支持。
        "vtsls", -- 专为 Vue 和 TypeScript 优化的高性能语言服务器。
        -- Shell
        "bashls", -- Shell 脚本的语法检查、补全和文档提示工具。
        -- Lua
        "lua_ls", -- 为 Neovim 配置和 Lua 项目提供强大的语言支持
        -- 其他常用
        "yamlls", -- YAML 文件的语法校验、补全，支持 K8s 等 schema
        "dockerls", -- Dockerfile 文件的语法高亮、指令补全和 linting
        "helm_ls", -- Kubernetes Helm 模板的语法高亮和值补全
      },

      -- (可选) 如果为 true，则在 lspconfig 启动任何未安装的服务器时，
      -- mason-lspconfig 都会自动尝试安装它。
      automatic_installation = true,
    },
  },

  -- 3. (可选但强烈推荐) Mason 与 nvim-lint 的桥梁
  -- nvim-lint 是一个用于配置和运行 Linter 的插件。
  {
    "mfussenegger/nvim-lint",
    dependencies = { "mason.nvim" },
    -- opts 部分现在只负责声明要安装什么，以及文件类型关联
    opts = {
      -- 在这里声明需要 Mason 自动安装的 Linter。
      -- 这些 Linter 会在保存文件时自动运行（如果配置了）。
      -- 注意：Linter 的 ensure_installed 与 LSP 的是分开的。
      ensure_installed = {
        "shellcheck", -- 检查 Shell 脚本
        "hadolint", -- 检查 Dockerfile
        "phpcs", -- 检查 PHP 代码规范
        "phpstan", -- 对 PHP 做静态分析，找出潜在错误
        -- 添加你需要的其他 Linter
      },
      -- 你可以在这里配置每个 linter 的参数
      linters_by_ft = {
        sh = { "shellcheck" },
        dockerfile = { "hadolint" },
        php = { "phpcs", "phpstan" },
        -- ...
      },
      -- 3. (可选) 如果你的 phpcs 配置文件不在项目根目录，可以在这里指定
      --    但通常 nvim-lint 会自动找到它。为保险起见，我们可以加上。
      -- linters = {
      --   phpcs = {
      --     args = { "--standard=" .. vim.fn.getcwd() .. "/.phpcs.xml" },
      --   },
      -- },
    },
  },

  -- 4. (可选但强烈推荐) Mason 与 conform.nvim 的桥梁 (用于格式化)
  -- conform.nvim 是一个轻量级、快速的格式化插件。
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      -- 在这里声明需要 Mason 自动安装的格式化工具。
      ensure_installed = {
        "php-cs-fixer", -- 格式化 PHP
        "shfmt", -- 格式化 Shell 脚本
        "stylua", -- 格式化 Lua
        "blade-formatter", -- 格式化 Laravel Blade
        -- 添加你需要的其他格式化工具
      },
      -- 按文件类型配置使用哪个格式化工具
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "php_cs_fixer" }, -- <--- 修改为下划线！
        blade = { "blade-formatter" },
        -- 禁用 sh、dotenv、dosini 的格式化
        sh = {},
        dotenv = {},
        dosini = {},
        -- ...
      },
      -- 在保存时自动格式化, LazyVim已经自动配置了，这里不用声明了
      --format_on_save = {
      --  timeout_ms = 500,
      --  lsp_fallback = true,
      --},
      -- 对具体格式化工具进行详细配置
      -- 这部分直接从你的 formatting.lua 迁移过来
      formatters = {
        ["php_cs_fixer"] = {
          -- command = "./vendor/bin/php-cs-fixer",
          -- command = vim.fn.getcwd() .. "/vendor/bin/php-cs-fixer",
          args = {
            "fix",
            "$FILENAME",
            -- "--config=.php-cs-fixer.dist.php",
            "--config="
              .. vim.fn.getcwd()
              .. "/.php-cs-fixer.dist.php", -- (推荐) config 也用绝对路径
            "--allow-risky=yes",
          },
          condition = function(ctx)
            return vim.fs.find(
              { ".php-cs-fixer.dist.php", ".php-cs-fixer.php" },
              { path = ctx.filename, upward = true }
            )[1] ~= nil
          end,
        },
      },
    },
  },
}
