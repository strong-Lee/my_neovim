-- ~/.config/nvim/lua/plugins/lsp.lua
-- https://deepwiki.com/neovim/nvim-lspconfig
-- nvim-lspconfig 是一个 "仅数据" 的仓库，为语言服务器协议（LSP）服务器提供基本、默认的配置，以与 Neovim 的原生 LSP 客户端协同工作。
-- 该仓库包含超过 400 种语言服务器配置，使用户能够通过一次 vim.lsp.enable('server_name') 调用即可激活 LSP 功能。

-- 一个辅助函数，用来读取 composer.json 并提取 PHP 版本
local function get_php_version(root_dir)
  local composer_json_path = root_dir .. "/composer.json"
  -- 使用 pcall 来安全地执行文件读取和 JSON 解析，防止因文件不存在或格式错误而报错
  local ok, composer_json_str = pcall(function()
    local file = io.open(composer_json_path, "r")
    if not file then
      return nil
    end
    local content = file:read("*a")
    file:close()
    return content
  end)

  if not ok or not composer_json_str then
    return "8.1.0" -- 如果找不到 composer.json，回退到默认版本
  end

  local composer_data = vim.fn.json_decode(composer_json_str)
  local php_version_constraint = composer_data and composer_data.require and composer_data.require.php

  if not php_version_constraint then
    return "8.1.0" -- 如果 composer.json 里没有 php 版本要求，也回退到默认版本
  end

  -- 从版本约束字符串中提取数字版本 (一个简单的实现)
  -- 例如从 "^8.1" 或 ">=8.1.0" 中提取 "8.1.0"
  local version = string.match(php_version_constraint, "(%d+%.%d+%.?%d*)")
  return version or "8.1.0" -- 如果提取失败，回退到默认版本
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local servers = {
      intelephense = {
        -- 这个函数会在 LSP 附加到项目时执行
        settings = function(args)
          -- args.root_dir 是 nvim-lspconfig 找到的项目根目录
          local project_php_version = get_php_version(args.root_dir)
          vim.notify("Intelephense is using PHP version: " .. project_php_version, vim.log.levels.INFO) -- 提示一下当前用的版本

          -- 返回完整的 settings table，但 phpVersion 是动态获取的
          return {
            intelephense = {
              files = {
                maxSize = 5000000,
                associations = { "*.php", "*.phtml" },
                exclude = {
                  "**/.git/**",
                  "**/.svn/**",
                  "**/.hg/**",
                  "**/CVS/**",
                  "**/.DS_Store/**",
                  "**/node_modules/**",
                  "**/bower_components/**",
                  "**/vendor/**/{Tests,tests}/**",
                  "**/.history/**",
                  "**/vendor/**/vendor/**",
                },
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                "redis",
              },
              environment = {
                phpVersion = project_php_version, -- 关键！使用我们动态获取的版本
              },
              diagnostics = {
                enable = true,
                missingDocblock = false,
                undefinedSymbols = false,
              },
              format = {
                enable = false,
              },
            },
          }
        end,
        init_options = {
          storagePath = vim.fn.stdpath("cache") .. "/intelephense",
        },
      },
    }

    opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, servers)

    local default_on_attach = opts.on_attach
    opts.on_attach = function(client, bufnr)
      if default_on_attach then
        default_on_attach(client, bufnr)
      end
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end
      map("gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("gi", vim.lsp.buf.implementation, "Go to Implementation")
    end
    return opts
  end,
}
