-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- intelephense 作为PHP主LSP
      intelephense = {
        -- 这样，格式化的工作就会完全交给 conform.nvim (也就是 php-cs-fixer)。
        capabilities = {
          textDocument = {
            formatting = false, -- 禁用LSP的格式化功能
            rangeFormatting = false,
          },
        },

        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern("composer.json", ".git")(fname) or vim.fn.getcwd()
        end,

        -- 你还可以在这里添加其他 intelephense 的特定设置
        settings = {
          intelephense = {
            -- 诊断 (Diagnostics) 设置，用来控制警告信息
            diagnostics = {
              -- 彻底关闭所有关于“缺少文档块”的警告
              -- 这会一次性解决 "Missing file doc comment" 和 "Missing @link tag"
              missingDocblock = false, -- 关闭 intelephense 的诊断（交给 phpstan/phpcs）
              -- 明确关闭对未定义符号的警告，Yii2 框架中很常见
              undefinedSymbols = false,
            },
            -- (可选) 如果你希望 intelephense 知道你的 Yii2 全局变量和类，可以这样做
            -- 这需要你生成一个索引文件，对于大型框架项目很有帮助
            stubs = {
              "core",
              "standard",
              "pcre",
              "json",
              "gd", -- 如果你用到了GD库
              "mbstring", -- 多字节字符串
              -- 你项目用到的其他PHP扩展...
              "yii2", -- 需要确保 'bmewburn.vscode-intelephense-client' 插件知道这个 stub
              -- 其他 stub...
            },
            -- 如果你还想禁用其他类型的警告，可以在这里添加
            -- environment = {
            --   phpVersion = "8.2", -- 告诉 intelephense 你的 PHP 版本
            -- },
          },
        },
      },
      -- ... 其他 LSP 服务器配置
    },
  },
}
