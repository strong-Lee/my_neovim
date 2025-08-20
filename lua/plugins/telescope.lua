-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        -- 这是关键部分
        find_command = { "fd", "--type", "f", "--hidden", "--no-ignore", "--glob", "!.git/*" },
        prompt_prefix = " ",
        selection_caret = " ",
        -- 其他你的自定义设置...
      },
    }
  end,
}
