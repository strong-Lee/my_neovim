-- ~/.config/nvim/lua/plugins/lsp.lua
-- https://deepwiki.com/neovim/nvim-lspconfig
-- 配置 PHP 的 intelephense 语言服务器，动态检测项目 PHP 版本。
-- 此文件专注于为 nvim-lspconfig 添加或覆盖特定语言服务器的详细配置。
-- Mason 负责安装，这里负责配置。

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      intelephense = {
        -- 我们将所有动态修改逻辑都集中在 on_new_config 中
        on_new_config = function(new_config, root_dir)
          -- 1. (可选) 设置固定的 PHP 版本
          vim.notify("Intelephense using fixed PHP v7.4.33", vim.log.levels.INFO, { title = "LSP" })
          new_config.settings = new_config.settings or {}
          new_config.settings.intelephense = new_config.settings.intelephense or {}
          new_config.settings.intelephense.environment = new_config.settings.intelephense.environment or {}
          new_config.settings.intelephense.environment.phpVersion = "7.4.33"

          -- 2. (核心修复) "包装" on_attach 函数
          --    a. 先保存 LazyVim 已经为我们设置好的 on_attach 函数
          local original_on_attach = new_config.on_attach

          -- b. 创建我们自己的新on_attach 函数来替换它
          new_config.on_attach = function(client, bufnr)
            if original_on_attach then
              original_on_attach(client, bufnr)
            end

            if client.server_capabilities then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end
        end,

        -- 这里的 settings 是基础配置，会被 on_new_config 进一步修改
        settings = {
          intelephense = {
            completion = { fullyQualify = false },
            diagnostics = {
              missingDocblock = false,
              undefinedSymbols = false,
              lineLength = false,
            },
            files = { maxSize = 5000000 },
          },
        },

        init_options = {
          storagePath = vim.fn.stdpath("cache") .. "/intelephense",
        },

        -- 注意：我们已经从这里移除了顶层的 on_attach 定义
      },
    },
  },
}
