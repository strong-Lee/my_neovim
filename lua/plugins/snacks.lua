-- ~/.config/nvim/lua/plugins/snacks.lua

return {
  -- 找到 LazyVim 默认加载的 snacks.nvim 插件
  {
    "folke/snacks.nvim",

    -- 使用 opts 函数来覆盖和修改默认配置
    opts = function(_, opts)
      -- 确保 explorer 的配置表存在
      opts.explorer = opts.explorer or {}

      -- ★★★★★ 核心修改：关闭 netrw 替换功能 ★★★★★
      -- 这将阻止 snacks 在你用 `vim .` 打开目录时自动启动
      opts.explorer.replace_netrw = false

      -- 你可以保留或修改 LazyVim 为 snacks 启用的其他模块
      -- 如果你不想修改任何其他设置，下面的部分可以省略
      -- 但保留它们可以让你清楚地知道哪些模块是激活的

      -- 以下是 LazyVim extra 中可能启用的 snacks 模块
      -- 你可以根据需要将它们设置为 true 或 false
      opts.bigfile = opts.bigfile or { enabled = true }
      opts.dashboard = opts.dashboard or { enabled = true }
      opts.indent = opts.indent or { enabled = true }
      opts.input = opts.input or { enabled = true }
      opts.picker = opts.picker or { enabled = true }
      opts.notifier = opts.notifier or { enabled = true }
      opts.quickfile = opts.quickfile or { enabled = true }
      opts.scope = opts.scope or { enabled = true }
      opts.scroll = opts.scroll or { enabled = true }
      opts.statuscolumn = opts.statuscolumn or { enabled = true }
      opts.words = opts.words or { enabled = true }
    end,
  },
  -- 禁用 netrw
  {
    "nvim-tree/nvim-web-devicons", -- 只是为了让 lazy.nvim 识别这是一个插件配置
    init = function()
      -- 在 Neovim 启动的非常早期阶段禁用 netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
