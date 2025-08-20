-- ~/.config/nvim/lua/plugins/project_management.lua
-- 多项目管理工作流

return {
  {
    "ahmedkhalf/project.nvim",
    lazy = false, -- 如果希望 nvim 启动时就加载，可以取消注释
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "zoxide", "pattern" }, -- 可选：检测项目的方式
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }, -- 可选：什么文件代表一个项目的根目录
        -- 你可以根据自己的需要添加其他配置，比如：
        -- silent_chdir = false, -- 当它自动切换目录时，会给你一个提示
      })
      -- 关键一步：加载它自带的 telescope 扩展
      require("telescope").load_extension("projects")
    end,
  },
  --{
  -- 说是两个插件有冲突
  --  "nvim-telescope/telescope-project.nvim",
  --  dependencies = { "ahmedkhalf/project.nvim" }, -- 确保 project.nvim 先加载
  --  config = function()
  --    require("telescope").load_extension("projects")
  --  end,
  --},
}
