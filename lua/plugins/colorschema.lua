-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- 在此文件中管理你的所有主题方案。
-- 通过注释和取消注释来轻松切换。

return {

  -- ===================================================================
  -- ★★★ 方案一：Catppuccin (当前启用) ★★★
  -- 柔和、现代的粉彩主题，非常受欢迎。
  -- ===================================================================
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000, -- 设置高优先级，确保它能覆盖任何默认主题
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "frappe", -- 可选: "latte", "frappe", "macchiato", "mocha"
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         telescope = true,
  --         treesitter = true,
  --         -- 添加对 lazyvim-extra 插件的支持，让界面更统一
  --         native_lsp = {
  --           enabled = true,
  --           underlines = {
  --             errors = { "underline" },
  --             hints = { "underline" },
  --             warnings = { "underline" },
  --             information = { "underline" },
  --           },
  --         },
  --       },
  --     })
  --     -- 应用主题
  --     vim.cmd.colorscheme("catppuccin")
  --   end,
  -- },

  -- ===================================================================
  -- ▼▼▼ 方案二：Everforest (备选，当前已注释) ▼▼▼
  -- 护眼的自然绿色调主题。
  -- ===================================================================
  {
    "sainnhe/everforest",
    name = "everforest",
    priority = 1000,
    config = function()
      -- 基础配置
      vim.g.everforest_background = "soft" -- 'soft', 'medium', 'hard'
      vim.g.everforest_better_performance = 1
      -- 应用主题
      vim.cmd.colorscheme("everforest")
      -- ★★★ 修复 Avante 样式简陋的关键代码 ★★★
      -- 强制修改 Avante 窗口的背景色，使其稍微深一点，与主窗口区分开
      -- 也可以尝试链接到 'Pmenu' (弹窗菜单颜色) 或自定义 hex 颜色
      vim.api.nvim_set_hl(0, "AvanteNormal", { bg = "#2b3339" }) -- 手动指定一个比 soft 背景略深的颜色
      vim.api.nvim_set_hl(0, "AvanteTitle", { fg = "#a7c080", bg = "#2b3339", bold = true }) -- 标题设为绿色
      vim.api.nvim_set_hl(0, "AvanteBorder", { fg = "#7fbbb3", bg = "#2b3339" }) -- 边框设为青色
      -- 如果觉得 RenderMarkdown 的背景色块太突兀，可以在这里微调
      -- 例如：让代码块背景融合
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#323c41" })
    end,
  },
}
