-- ~/.config/nvim/lua/plugins/ai.lua

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- 重要：如果你是 Linux/Mac，使用 "make"。
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
    --"ibhagwan/fzf-lua", -- 如果你更喜欢 fzf
    "hrsh7th/nvim-cmp",
    -- 图片粘贴支持 (支持拖拽图片或粘贴截图)
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = { insert_mode = true },
          use_absolute_path = true, -- Windows/Mac 都建议开启
        },
      },
    },

    -- Markdown 渲染 (让聊天界面更好看，不再是纯文本)
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },

  opts = {
    -- 设置提供商为 gemini
    provider = "gemini",

    -- ★★★ 核心修复：强制改为 legacy 模式 ★★★
    -- 这会禁止 AI 自己瞎调用工具（从而根除死循环），
    -- 但你依然可以手动用 @ 添加文件，这正是你想要的“可控感”。
    mode = "legacy", -- Switch from "agentic" to "legacy"

    file_selector = {
      provider = "telescope",
      provider_opts = {},
    },

    providers = {
      -- 配置 Gemini
      gemini = {
        -- 推荐使用 flash (速度快) 或 pro (逻辑强)
        -- 在写复杂逻辑时，建议用 gemini-2.5-pro
        model = "gemini-2.5-flash",
        temperature = 0, -- 编程任务建议温度设低，保持稳定
        max_tokens = 4096,
        disable_tools = true,
        timeout = 20000, -- 设置超时熔断 (毫秒)
      },
      -- 配置 DeepSeek (使用 openai 协议)
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat", -- DeepSeek V3 的模型名
        timeout = 30000,
        -- 这里的 key 需要你在 shell 里设置 export DEEPSEEK_API_KEY="sk-..."
        -- 并且在这里告诉 avante 去读这个环境变量
        api_key_name = "DEEPSEEK_API_KEY",
        -- 加上这行后，DeepSeek 就绝对无法调用 view 或 python 了
        disable_tools = true,
        extra_request_body = {
          temperature = 0,
          max_tokens = 4096,
        },
      },
    },
    -- 行为设置
    behaviour = {
      auto_suggestions = false, -- 是否在输入时自动建议（类似 Copilot），不喜欢可以关掉
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false, -- 是否自动应用 diff，建议 false，手动确认更安全
      support_paste_from_clipboard = true, -- 开启剪贴板支持（配合 img-clip）
      enable_file_selector = true, -- 确保启用文件选择
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
      width = 34, -- 宽度百分比
      sidebar_header = {
        align = "center",
        rounded = true,
      },
      input = {
        prefix = "> ",
        height = 8, -- 输入框高度
      },
      edit = {
        border = "rounded",
        start_insert = true, -- 打开编辑框直接进入输入模式
      },
      ask = {
        floating = false, -- 设为 false 让其平铺，看起来更整洁；设为 true 是浮动窗口
        -- start_insert = true,
        border = "rounded",
      },
    },
    --- @class AvanteRepoMapConfig
    repo_map = {
      ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- 忽略某些文件让界面更干净
    },
  },
}
