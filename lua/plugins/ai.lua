-- ~/.config/nvim/lua/plugins/ai.lua

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- ⚠️ 重要：如果你是 Linux/Mac，使用 "make"。
  -- 如果你是 Windows，请看官方文档关于 powershell 的构建命令
  build = "make",
  version = false, -- Never set this value to "*"! Never!

  dependencies = {
    -- Avante 不是把你的代码当成纯文本读的，它需要知道哪里是函数开始，哪里是变量定义。
    -- Treesitter 负责把代码“解剖”成结构化数据给 Avante 用。没有它，Avante 就是瞎子。
    "nvim-treesitter/nvim-treesitter", -- 语法高亮和代码解析器
    "stevearc/dressing.nvim", -- 改进 UI 输入体验，接管 Neovim 默认的输入框和选择框。
    -- 它里面包含了大量的实用工具（比如读写文件、处理路径、发送网络请求）。90% 的 Neovim 插件都依赖它，它就像是一个基础地基。
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim", -- 专门用来画 UI 组件的。
    --- 可选依赖 ---
    "nvim-tree/nvim-web-devicons", -- 给文件加图标。
    "nvim-telescope/telescope.nvim", -- 如果你需要用 telescope 选择文件, 强大的文件搜索器。
    -- "ibhagwan/fzf-lua", -- 如果你更喜欢 fzf
  },

  opts = {
    -- 设置提供商为 gemini
    provider = "gemini",
    providers = {
      -- 配置 Gemini
      gemini = {
        -- 推荐使用 flash (速度快) 或 pro (逻辑强)
        -- 在写复杂逻辑时，建议用 gemini-1.5-pro-latest
        model = "gemini-1.5-pro-latest",
        temperature = 0, -- 编程任务建议温度设低，保持稳定
        max_tokens = 4096,
      },
    },
    -- 行为设置
    behaviour = {
      auto_suggestions = false, -- 是否在输入时自动建议（类似 Copilot），不喜欢可以关掉
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false, -- 是否自动应用 diff，建议 false，手动确认更安全
      support_paste_from_clipboard = false,
    },
    -- 界面映射 (Mapping) - 可以在这里自定义
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co", -- 接受当前更改 (Current / Ours)
        theirs = "ct", -- 接受传入更改 (Theirs / Incoming)
        all_theirs = "ca", -- 接受所有传入更改
        both = "cb", -- 两者保留
        cursor = "cc", -- 在光标处解决
        next = "]x", -- 下一个冲突
        prev = "[x", -- 上一个冲突
      },
      suggestion = {
        accept = "<M-l>", -- Alt + l 接受建议
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
    -- 窗口外观设置
    windows = {
      position = "right", -- 侧边栏位置
      width = 30, -- 宽度百分比
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
  },
}
