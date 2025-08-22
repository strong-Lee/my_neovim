-- ~/.config/nvim/lua/plugins/telescope_extensions.lua
return {
  {
    -- 这是一个 C 语言编写的 Telescope 排序和筛选引擎。
    -- 它将 Telescope 最消耗性能的部分用原生代码重写，速度提升 10-200 倍。
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make", -- 需要有 C 编译器环境，macOS 的 Xcode Command Line Tools 自带
    -- 确保在 telescope 加载后加载
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    -- 统一 Neovim 的 UI
    -- 将 Neovim 默认的、丑陋的命令行选择菜单替换为漂亮的 Telescope 界面。
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      -- 这段配置是关键，它会覆盖默认的 ui.select
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
