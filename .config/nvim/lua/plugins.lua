return require("lazy").setup({
  -- index: a

  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
    event = "VimEnter",
  },

  {
    "hotwatermorning/auto-git-diff",
    event = "VeryLazy",
  },

  {
    "rmagatti/auto-session",
    init = function()
      vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>")

      vim.g.auto_session_pre_save_cmds = { "NvimTreeClose" }
      vim.opt.sessionoptions:append({ "folds", "terminal", "winpos" })
    end,
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_suppress_dirs = { "~" },
      })
    end,
    event = "VimEnter",
  },

  -- index: b

  {
    "famiu/bufdelete.nvim",
    init = function()
      vim.keymap.set("n", "<m-w>", function()
        require("bufdelete").bufdelete(0, true)
      end)
    end,
    event = "VeryLazy",
  },

  -- index: c

  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      vim.g.catppuccin_flavour = "mocha"
    end,
    config = function()
      require("catppuccin").setup({
        integrations = {
          hop = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "tkmpypy/chowcho.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    init = function()
      vim.keymap.set("n", "<leader>wp", function()
        require("chowcho").run()
      end)
    end,
    keys = "<leader>wp",
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup()
    end,
    event = "VeryLazy",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    event = "CursorMoved",
  },
  --
  {
    "rhysd/committia.vim",
  },

  -- index: d

  {
    "monaqa/dial.nvim",
    init = function()
      vim.keymap.set({ "n", "v" }, "<c-a>", "<plug>(dial-increment)")
      vim.keymap.set({ "n", "v" }, "<c-x>", "<plug>(dial-decrement)")
      vim.keymap.set("v", "g<c-a>", "<plug>(dial-increment-additional)")
      vim.keymap.set("v", "g<c-x>", "<plug>(dial-decrement-additional)")
    end,
    event = "CursorMoved",
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    init = function()
      vim.keymap.set("n", "<leader>gd", function()
        if vim.bo.filetype == "DiffviewFiles" then
          require("diffview").close()
        else
          require("diffview").open()
        end
      end)
    end,
    config = function()
      require("diffview").setup()
    end,
    event = "VeryLazy",
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
    event = "VeryLazy",
  },

  -- index: f

  {
    "gukz/ftFT.nvim",
    config = function()
      require("ftFT").setup()
    end,
    keys = { "f", "F", "t", "T" },
  },

  -- index: g

  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
    event = "VeryLazy",
  },

  {
    "ruifm/gitlinker.nvim",
    config = function()
      require("gitlinker").setup()
    end,
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    init = function()
      vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>")
    end,
    config = function()
      require("gitsigns").setup()
    end,
    event = "VeryLazy",
  },

  {
    "aspeddro/gitui.nvim",
    init = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>Gitui<cr>")
    end,
    config = function()
      require("gitui").setup()
    end,
    cmd = "Gitui",
  },

  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    build = ":GoUpdateBinaries",
    init = function()
      vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<cr>")
      vim.keymap.set("n", "<leader>tt", "<cmd>GoTestFunc<cr>")
    end,
    config = function()
      require("go").setup()
    end,
    cmd = "GoUpdateBinaries",
    ft = "go",
  },

  {
    "edolphin-ydf/goimpl.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function()
      vim.keymap.set("n", "<leader>im", function()
        require("telescope").extensions.goimpl.goimpl()
      end)
    end,
    config = function()
      require("telescope").load_extension("goimpl")
    end,
    ft = "go",
  },

  {
    "rmagatti/goto-preview",
    init = function()
      vim.keymap.set("n", "gpd", function()
        require("goto-preview").goto_preview_definition()
      end)
      vim.keymap.set("n", "gpi", function()
        require("goto-preview").goto_preview_implementation()
      end)
    end,
    config = function()
      require("goto-preview").setup({ width = 120, height = 45 })
    end,
    event = "VeryLazy",
  },

  -- index: h

  {
    "phaazon/hop.nvim",
    init = function()
      vim.keymap.set("n", "<leader><cr>", "<cmd>HopWord<cr>")
    end,
    config = function()
      require("hop").setup()
    end,
    cmd = "HopWord",
  },

  -- index: i

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        filetype_exclude = { "alpha" },
        space_char_blankline = " ",
        show_current_context = true,
      })
    end,
    event = "VeryLazy",
  },

  {
    "Darazaki/indent-o-matic",
    config = function()
      require("indent-o-matic").setup({})
    end,
    event = "VeryLazy",
  },

  -- index: k

  {
    "allaman/kustomize.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("kustomize").setup({})
    end,
    ft = "yaml",
  },

  -- index: l

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
    event = "VeryLazy",
  },

  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup()
    end,
    event = "VeryLazy",
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    init = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
      vim.keymap.set("n", "<leader>vl", function()
        require("lsp_lines").toggle()
      end)
    end,
    config = function()
      require("lsp_lines").setup()
    end,
    event = "VeryLazy",
  },

  {
    "glepnir/lspsaga.nvim",
    init = function()
      vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<cr>")
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    end,
    config = function()
      require("lspsaga").setup()
    end,
    cmd = "Lspsaga",
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "rmagatti/auto-session", "SmiteshP/nvim-navic", "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = 3,
          theme = "catppuccin",
          refresh = {
            statusline = 100,
            tabline = 100,
          },
        },
        sections = {
          lualine_a = { { "mode" } },
          lualine_b = { { "filename", path = 1 } },
          lualine_c = {
            { require("auto-session.lib").current_session_name },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return require("nvim-navic").is_available()
              end,
            },
          },
          lualine_x = { { "encoding" }, { "fileformat" }, { "filetype", icon_only = true } },
          lualine_y = { { "branch" }, { "diff" }, { "diagnostics" } },
          lualine_z = { { "location" }, { "selectioncount" } },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {},
          lualine_b = { "buffers" },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          {
            sections = { lualine_b = { { "filetype" } } },
            filetypes = { "NvimTree", "packer" },
          },
        },
      })
    end,
    event = "VeryLazy",
  },

  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
    end,
  },

  -- index: m

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          -- "dagger",
          "dockerls",
          "gopls",
          "jsonls",
          "lua_ls",
          "pyright",
          "sqlls",
          "terraformls",
          "vimls",
          "yamlls",
        },
      })
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false,
      })
    end,
    event = "VeryLazy",
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    event = "VeryLazy",
  },

  {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup()
    end,
    event = "VeryLazy",
  },

  -- index: n

  {
    "TimUntersberger/neogit",
    init = function()
      vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>")
    end,
    config = function()
      require("neogit").setup()
    end,
    cmd = "Neogit",
  },

  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("noice").setup({
        lsp = {
          signature = {
            enabled = false,
          },
        },
        routes = {
          {
            view = "mini",
            filter = { event = "msg_showmode" },
          },
          {
            view = "mini",
            filter = { event = "msg_show", find = "written" },
          },
        },
      })
    end,
    event = "VeryLazy",
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "lukas-reineke/lsp-format.nvim" },
    config = function()
      require("null-ls").setup({
        sources = {
          -- code_actions
          require("null-ls").builtins.code_actions.cspell,
          require("null-ls").builtins.code_actions.gitsigns,
          -- diagnostics
          require("null-ls").builtins.diagnostics.flake8,
          require("null-ls").builtins.diagnostics.markdownlint,
          require("null-ls").builtins.diagnostics.protolint,
          require("null-ls").builtins.diagnostics.shellcheck,
          require("null-ls").builtins.diagnostics.zsh,
          -- formatting
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.buf,
          require("null-ls").builtins.formatting.clang_format,
          require("null-ls").builtins.formatting.goimports,
          require("null-ls").builtins.formatting.isort,
          require("null-ls").builtins.formatting.latexindent,
          require("null-ls").builtins.formatting.markdownlint,
          require("null-ls").builtins.formatting.prettier,
          require("null-ls").builtins.formatting.shfmt,
          require("null-ls").builtins.formatting.sql_formatter,
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.terraform_fmt,
          require("null-ls").builtins.formatting.trim_newlines,
        },
        on_attach = function(client, _)
          if client.supports_method("textDocument/formatting") then
            require("lsp-format").on_attach(client)
          end
        end,
      })
    end,
    event = "VeryLazy",
  },

  {
    "nacro90/numb.nvim",
    config = function()
      require("numb").setup()
    end,
    event = "CmdlineEnter",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      require("cmp").event:on(
        "confirm_done",
        -- require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
        require("nvim-autopairs.completion.cmp").on_confirm_done()
      )
    end,
    event = "InsertEnter",
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "petertriho/cmp-git",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "lukas-reineke/cmp-rg",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        },
        mapping = {
          ["<c-e>"] = cmp.mapping({ c = cmp.mapping.close(), i = cmp.mapping.abort() }),
          ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c", "i" }),
          ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c", "i" }),
          ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "c", "i" }),
          ["<cr>"] = cmp.mapping({
            c = cmp.mapping.confirm({ select = false }),
            i = cmp.mapping.confirm({ select = true }),
          }),
          ["<tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        formatting = {
          format = require("lspkind").cmp_format({
            menu = {
              buffer = "[Buffer]",
              calc = "[Calc]",
              emoji = "[Emoji]",
              cmp_git = "[Git]",
              luasnip = "[Snip]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              rg = "[RipGrep]",
            },
          }),
        },
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "calc" },
          { name = "emoji" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "path" },
          { name = "rg" },
        }),
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "emoji" },
          { name = "cmp_git" },
          { name = "rg" },
        }),
      })

      cmp.setup.cmdline("/", {
        sources = cmp.config.sources({
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "cmdline" },
        }),
      })
    end,
    event = { "CmdlineEnter", "InsertEnter" },
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    event = "VeryLazy",
  },

  {
    "yamatsum/nvim-cursorline",
    config = function()
      require("nvim-cursorline").setup()
    end,
    event = "VeryLazy",
  },

  {
    "booperlv/nvim-gomove",
    init = function()
      vim.keymap.set("n", "<m-left>", "<plug>GoNSMLeft")
      vim.keymap.set("n", "<m-down>", "<plug>GoNSMDown")
      vim.keymap.set("n", "<m-right>", "<plug>GoNSMRight")
      vim.keymap.set("n", "<m-up>", "<plug>GoNSMUp")

      vim.keymap.set("v", "<m-left>", "<plug>GoVSMLeft")
      vim.keymap.set("v", "<m-down>", "<plug>GoVSMDown")
      vim.keymap.set("v", "<m-right>", "<plug>GoVSMRight")
      vim.keymap.set("v", "<m-up>", "<plug>GoVSMUp")
    end,
    config = function()
      require("gomove").setup({
        map_defaults = false,
      })
    end,
    event = "VeryLazy",
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end,
    event = "CmdLineEnter",
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "lukas-reineke/lsp-format.nvim",
      "williamboman/mason-lspconfig.nvim",
      "SmiteshP/nvim-navic",
    },
    init = function()
      vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")
    end,
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server)
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local on_attach = function(client, buffer)
            require("lsp-format").on_attach(client)
            if client.server_capabilities.documentSymbolProvider then
              require("nvim-navic").attach(client, buffer)
            end

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer })
            vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, { buffer = buffer })
          end

          local opts = { capabilities = capabilities, on_attach = on_attach }

          if server == "gopls" then
            opts.on_attach = function(client, buffer)
              on_attach(client, buffer)
              client.server_capabilities.document_formatting = false
              client.server_capabilities.document_range_formatting = false
            end
          end

          if server == "lua_ls" then
            opts.on_attach = function(client, buffer)
              on_attach(client, buffer)
              client.server_capabilities.document_formatting = false
              client.server_capabilities.document_range_formatting = false
            end
            opts.settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                  },
                },
              },
            }
          end

          require("lspconfig")[server].setup(opts)
        end,
      })
    end,
    event = "VeryLazy",
  },

  {
    "rcarriga/nvim-notify",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function()
      vim.keymap.set("n", "<leader>nf", function()
        require("telescope").extensions.notify.notify()
      end)
    end,
    config = function()
      vim.notify = require("notify")
    end,
  },

  {
    "dstein64/nvim-scrollview",
    event = "VeryLazy",
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
    event = "VeryLazy",
  },

  {
    "nguyenvukhang/nvim-toggler",
    init = function()
      vim.keymap.set({ "n", "v" }, "<leader>tg", require("nvim-toggler").toggle)
    end,
    config = function()
      require("nvim-toggler").setup({
        inverses = {
          ["before"] = "after",
          ["on"] = "off",
          ["true"] = "false",
          ["yes"] = "no",
        },
        remove_default_keybinds = true,
      })
    end,
    keys = "<leader>tg",
  },

  {
    "akinsho/nvim-toggleterm.lua",
    config = function()
      require("toggleterm").setup({ open_mapping = "<c-t>t", direction = "float" })
    end,
    keys = "<c-t>t",
  },

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup()
    end,
    cmd = "TransparentToggle",
  },

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    init = function()
      vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")
    end,
    config = function()
      local api = require("nvim-tree.api")

      local on_attach = function(buffer)
        vim.keymap.set("n", "<cr>", api.node.edit, { buffer = buffer })
        vim.keymap.set("n", "<c-v>", api.node.open.vertical, { buffer = buffer })
        vim.keymap.set("n", "<c-x>", api.node.open.horizontal, { buffer = buffer })
        vim.keymap.set("n", "<tab>", api.node.open.preview, { buffer = buffer })
        vim.keyamp.set("nf", "H", api.tree.toggle_hidden_filter, { buffer = buffer })
        vim.keymap.set("n", "R", api.tree.reload, { buffer = buffer })
        vim.keymap.set("n", "a", api.fs.create, { buffer = buffer })
        vim.keymap.set("n", "d", api.fs.remove, { buffer = buffer })
        vim.keymap.set("n", "r", api.fs.rename, { buffer = buffer })
        vim.keymap.set("n", "x", api.fs.cut, { buffer = buffer })
        vim.keymap.set("n", "c", api.fs.copy.node, { buffer = buffer })
        vim.keymap.set("n", "y", api.fs.copy.filename, { buffer = buffer })
        vim.keymap.set("n", "Y", api.fs.copy.relative_path, { buffer = buffer })
        vim.keymap.set("n", "p", api.fs.paste, { buffer = buffer })
        vim.keymap.set("n", "f", api.live_filter.start, { buffer = buffer })
        vim.keymap.set("n", "F", api.live_filter.clear, { buffer = buffer })
        vim.keymap.set("n", "g?", api.tree.toggle_help, { buffer = buffer })
      end

      require("nvim-tree").setup({
        on_attach = on_attach,
      })

      require("nvim-tree").setup({
        reload_on_bufenter = true,
        diagnostics = { enable = true },
        git = { ignore = false },
        view = { width = 40 },
      })
    end,
    cmd = { "NvimTreeClose", "NvimTreeFindFileToggle", "NvimTreeToggle" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.cue = {
        install_info = {
          url = "https://github.com/eonpatapon/tree-sitter-cue",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
        },
        filetype = "cue",
      }

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cue",
          "dockerfile",
          "go",
          "gomod",
          "gowork",
          "hcl",
          "json",
          "lua",
          "make",
          "markdown",
          "proto",
          "python",
          "sql",
          "toml",
          "vim",
          "yaml",
        },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
    event = "VeryLazy",
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
        },
      })
    end,
    event = "VeryLazy",
  },

  {
    "mrjones2014/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup({ rainbow = { enable = true } })
    end,
    event = "VeryLazy",
  },

  {
    "haringsrob/nvim_context_vt",
    int = function()
      vim.keymap.set("n", "<leader>ct", "<cmd>NvimContextVtToggle<cr>")
    end,
    event = "VeryLazy",
  },

  -- index: o

  {
    "pwntester/octo.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("octo").setup()
    end,
    cmd = "Octo",
  },

  -- index: p

  {
    "nvim-treesitter/playground",
    config = function()
      require("nvim-treesitter.configs").setup({ playground = { enable = true } })
    end,
    cmd = "TSPlaygroundToggle",
  },

  -- index: r

  {
    "tversteeg/registers.nvim",
    config = function()
      require("registers").setup()
    end,
    keys = '"',
  },

  -- index: s

  {
    "rmagatti/session-lens",
    dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    init = function()
      vim.keymap.set("n", "<leader>ls", function()
        require("session-lens").search_session()
      end)
    end,
    config = function()
      require("session-lens").setup()
      require("telescope").load_extension("session-lens")
    end,
    keys = "VeryLazy",
  },

  -- index: t

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
    init = function()
      vim.keymap.set("n", "<leader><leader>", function()
        require("telescope.builtin").buffers()
      end)
      vim.keymap.set("n", "<leader>ff", function()
        require("telescope.builtin").find_files({ hidden = true })
      end)
      vim.keymap.set("n", "<leader>Gb", function()
        require("telescope.builtin").git_branches()
      end)
      vim.keymap.set("n", "<leader>jl", function()
        require("telescope.builtin").jumplist()
      end)
      vim.keymap.set("n", "<leader>lg", function()
        require("telescope.builtin").live_grep({
          additional_args = function()
            return "--hidden"
          end,
        })
      end)
      vim.keymap.set("n", "<leader>lG", function()
        require("telescope.builtin").live_grep({
          glob_pattern = "!*_test.go",
        })
      end)
      vim.keymap.set("n", "gi", function()
        require("telescope.builtin").lsp_implementations()
      end)
      vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references()
      end)
    end,
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
    event = "VeryLazy",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    init = function()
      vim.keymap.set("n", "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>")
    end,
    config = function()
      require("trouble").setup()
    end,
    cmd = "TroubleToggle",
  },

  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup()
    end,
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist", "TZNarrow" },
  },

  -- index: u

  {
    "axieax/urlview.nvim",
    init = function()
      vim.keymap.set("n", "<leader>uv", "<cmd>UrlView<cr>")
    end,
    config = function()
      require("urlview").setup()
    end,
    cmd = "UrlView",
  },

  -- index: v

  {
    "tanvirtin/vgit.nvim",
    init = function()
      vim.keymap.set("n", "<leader>gh", "<cmd>VGit buffer_history_preview<cr>")
    end,
    config = function()
      require("vgit").setup({
        keymaps = {
          ["n <c-k>"] = "hunk_up",
          ["n <c-j>"] = "hunk_down",
        },
      })
    end,
    cmd = "VGit",
  },

  {
    "heavenshell/vim-pydocstring",
    build = "make install",
    init = function()
      vim.keymap.set("n", "<leader>ds", "<cmd>Pydocstring<cr>")

      vim.g.pydocstring_enable_mapping = false
      vim.g.pydocstring_formatter = "google"
    end,
    ft = "python",
  },

  {
    "segeljakt/vim-silicon",
    cmd = "Silicon",
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },

  -- index: z

  {
    "yuki-yano/zero.nvim",
    config = function()
      require("zero").setup()
    end,
    keys = "0",
  },
})
