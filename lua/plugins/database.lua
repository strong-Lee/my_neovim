-- lua/plugins/database.lua
-- 几乎所有的主流数据库，包括 MySQL 和 PostgreSQL

-- 有问题，以后有时间再处理，本地mysql与远程版本不兼容
return {
  --{
  --  "tpope/vim-dadbod",
  --  dependencies = {
  --    "kristijanhusak/vim-dadbod-ui",
  --    "kristijanhusak/vim-dadbod-completion", -- (可选) 提供 SQL 补全
  --  },
  --  config = function()
  --    -- 显式地告诉 dadbod 在哪里可以找到 mysql 命令
  --    -- vim.g.db_adapter_path = { mysql = "/usr/local/bin/mysql" }
  --    -- 使用 vim.fn.exepath() 动态查找 mysql 的可执行文件路径
  --    -- 这和在终端运行 `which mysql` 的效果一样，能找到最准确的路径
  --    local mysql_path = vim.fn.exepath("mysql")

  --    -- 检查是否找到了路径，如果找到了，才设置全局变量
  --    if mysql_path ~= "" then
  --      vim.g.db_adapter_path = { mysql = mysql_path }
  --    end
  --    -- 设置 UI 插件的全局变量
  --    vim.g.db_ui_use_nerd_fonts = 1 -- 使用 Nerd Font 图标，更好看
  --    vim.g.db_ui_show_help = 0 -- 默认不显示帮助

  --    -- (可选) 添加快捷键
  --    vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Toggle DB UI" })
  --  end,
  --},
}
