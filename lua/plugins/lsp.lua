-- ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- PHP LSP 服务器配置
      intelephense = {
        -- 这样，格式化的工作就会完全交给 conform.nvim (也就是 php-cs-fixer)。
        capabilities = {
          textDocument = {
            formatting = false,
            rangeFormatting = false,
          },
        },
        -- 你还可以在这里添加其他 intelephense 的特定设置
        -- settings = { ... }
      },
      -- ... 其他 LSP 服务器配置
    },
  },
}
