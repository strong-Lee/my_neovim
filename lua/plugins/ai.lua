-- ~/.config/nvim/lua/plugins/ai.lua

return {
  -- "yetone/avante.nvim",
  -- build = "make",
  -- version = false, -- Never set this value to "*"! Never!

  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter",
  --   "nvim-lua/plenary.nvim",
  --   "MunifTanjim/nui.nvim",
  --   "nvim-telescope/telescope.nvim",
  --   "nvim-tree/nvim-web-devicons",
  -- },

  -- opts = {
  --   provider = "groq",
  --   -- ★★★ 最终修复：添加这个选项，禁用自动上下文 ★★★
  --   auto_select = false,
  --   providers = {
  --     groq = {
  --       __inherited_from = "openai",
  --       model = "llama3-8b-8192",
  --       endpoint = "https://api.groq.com/openai/v1",
  --       extra_request_body = {
  --         max_tokens = 4096,
  --       },
  --     },
  --   },
  -- },
}
