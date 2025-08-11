-- ~/.config/nvim/lua/plugins/snippets.lua

return {
  {
    "L3MON4D3/LuaSnip",
    -- `opts` 会在插件默认配置加载后，智能地与之合并，这是更安全的方式。
    opts = function(_, opts)
      -- `opts` 参数是 LazyVim 传递过来的默认配置，我们可以在此基础上修改。
      -- 我们要做的就是加载我们自己的片段文件。
      -- `luasnip.loaders.from_lua` 是 LuaSnip 官方推荐的加载方式。
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/custom-snippets" })
    end,
  },
}
