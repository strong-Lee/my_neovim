-- ~/.config/nvim/lua/custom-snippets/php.lua

-- 引入 luasnip 的核心函数
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- 返回一个包含所有片段的 table
return {
  -- 触发词: pubf
  s("pubf", {
    t({ "public function " }),
    i(1, "methodName"), -- 第一个光标停留点
    t({ "()" }),
    t({ "" }),
    t({ "{" }),
    t({ "    " }),
    i(0), -- 最后一个光标停留点 (按 Tab 跳转至此)
    t({ "" }),
    t({ "}" }),
  }),

  -- 触发词: pdo
  s("pdo", {
    t({ '$dsn = "mysql:host=localhost;dbname=test;charset=utf8";' }),
    t({ '$username = "root";' }),
    t({ '$password = "";' }),
    t({ "" }),
    t({ "try {" }),
    t({ "    $pdo = new PDO($dsn, $username, $password);" }),
    t({ "    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);" }),
    t({ "    " }),
    i(0),
    t({ "} catch (PDOException $e) {" }),
    t({ '    echo "Connection failed: " . $e->getMessage();' }),
    t({ "}" }),
  }),
}
