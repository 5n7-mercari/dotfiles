local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
  s("pkgm", {
    t({
      "package main",
      "",
      'import "fmt"',
      "",
      "func main() {",
      '\tfmt.Println("Hello, world!")',
      "\t",
    }),
    i(1),
    t({
      "",
      "}",
    }),
  }),

  s("pkgmr", {
    t({
      "package main",
      "",
      "import (",
      '\t"fmt"',
      '\t"os"',
      ")",
      "",
      "func run() error {",
      '\tfmt.Println("Hello, world!")',
      "\t",
    }),
    i(1),
    t({
      "",
      "",
      "\treturn nil",
      "}",
      "",
      "func main() {",
      "\tif err := run(); err != nil {",
      "\t\tfmt.Fprintln(os.Stderr, err)",
      "\t\tos.Exit(1)",
      "\t}",
      "}",
    }),
  }),

  s("iferr", {
    t("if err := "),
    i(1),
    t({
      "; err != nil {",
      "\treturn ",
    }),
    i(2, "err"),
    t({
      "",
      "}",
    }),
  }),

  s("errf", {
    t('fmt.Errorf("failed to '),
    i(1),
    t(': %w", err)'),
  }),
})
