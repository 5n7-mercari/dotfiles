vim.cmd("packadd packer.nvim")

vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    autocmd User PackerCompileDone lua vim.notify("[packer.nvim] Compiled")
  augroup END
]])

require("packer").init({
  display = {
    open_fn = require("packer.util").float,
  },
})

return require("packer").startup({
  function(use)
    -- index: a

    use({
      "goolord/alpha-nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        require("alpha").setup(require("alpha.themes.startify").config)
      end,
      event = { "VimEnter" },
    })

    use({
      "hotwatermorning/auto-git-diff",
      event = { "VimEnter" },
    })

    use({
      "rmagatti/auto-session",
      after = { "git-conflict.nvim" },
      config = function()
        require("auto-session").setup({
          auto_save_enabled = true,
          auto_restore_enabled = true,
          auto_session_suppress_dirs = { "~" },
        })
      end,
      setup = function()
        vim.g.auto_session_pre_save_cmds = { "NvimTreeClose" }
        vim.opt.sessionoptions:append({ "folds", "terminal", "winpos" })
      end,
    })

    -- index: b

    use({
      "famiu/bufdelete.nvim",
      setup = function()
        vim.keymap.set("n", "<m-w>", function()
          require("bufdelete").bufdelete(0, true)
        end)
      end,
      event = { "VimEnter" },
    })

    -- index: c

    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({
          integrations = {
            hop = true,
          },
        })
        vim.cmd.colorscheme("catppuccin")
      end,
      setup = function()
        vim.g.catppuccin_flavour = "mocha"
      end,
    })

    use({
      "tkmpypy/chowcho.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      setup = function()
        vim.keymap.set("n", "<leader>wp", function()
          require("chowcho").run()
        end)
      end,
    })

    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({})
      end,
      event = { "CursorMoved" },
    })

    use({
      "rhysd/committia.vim",
    })

    -- index: d

    use({
      "monaqa/dial.nvim",
      setup = function()
        vim.keymap.set({ "n", "v" }, "<c-a>", "<plug>(dial-increment)")
        vim.keymap.set({ "n", "v" }, "<c-x>", "<plug>(dial-decrement)")
        vim.keymap.set("v", "g<c-a>", "<plug>(dial-increment-additional)")
        vim.keymap.set("v", "g<c-x>", "<plug>(dial-decrement-additional)")
      end,
      event = { "CursorMoved" },
    })

    use({
      "sindrets/diffview.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        { "nvim-lua/plenary.nvim" },
      },
      config = function()
        require("diffview").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gd", function()
          if vim.bo.filetype == "DiffviewFiles" then
            require("diffview").close()
          else
            require("diffview").open()
          end
        end)
      end,
      event = { "VimEnter" },
    })

    use({
      "stevearc/dressing.nvim",
      config = function()
        require("dressing").setup()
      end,
      event = { "VimEnter" },
    })

    -- index: f

    use({
      "gukz/ftFT.nvim",
      config = function()
        require("ftFT").setup()
      end,
      keys = { "f", "F", "t", "T" },
    })

    use({
      "j-hui/fidget.nvim",
      after = { "nvim-lspconfig" },
      config = function()
        require("fidget").setup()
      end,
    })

    use({
      "rafamadriz/friendly-snippets",
      event = { "VimEnter" },
    })

    -- index: g

    use({
      "akinsho/git-conflict.nvim",
      config = function()
        require("git-conflict").setup()
      end,
    })

    use({
      "ruifm/gitlinker.nvim",
      config = function()
        require("gitlinker").setup()
      end,
      keys = { "<leader>gy" },
    })

    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>")
      end,
      event = { "VimEnter" },
    })

    use({
      "aspeddro/gitui.nvim",
      config = function()
        require("gitui").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gg", "<cmd>Gitui<cr>")
      end,
      cmd = { "Gitui" },
    })

    use({
      "ray-x/go.nvim",
      run = { ":GoUpdateBinaries" },
      config = function()
        require("go").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<cr>")
      end,
      cmd = { "GoUpdateBinaries" },
      ft = { "go" },
    })

    use({
      "edolphin-ydf/goimpl.nvim",
      after = { "nvim-lspconfig", "nvim-treesitter", "telescope.nvim" },
      config = function()
        require("telescope").load_extension("goimpl")
      end,
      setup = function()
        vim.keymap.set("n", "<leader>im", function()
          require("telescope").extensions.goimpl.goimpl()
        end)
      end,
    })

    use({
      "rmagatti/goto-preview",
      after = { "nvim-lspconfig" },
      config = function()
        require("goto-preview").setup({ width = 120, height = 45 })
      end,
      setup = function()
        vim.keymap.set("n", "gpd", function()
          require("goto-preview").goto_preview_definition()
        end)
        vim.keymap.set("n", "gpi", function()
          require("goto-preview").goto_preview_implementation()
        end)
        vim.keymap.set("n", "gP", function()
          require("goto-preview").close_all_win()
        end)
      end,
    })

    -- index: h

    use({
      "phaazon/hop.nvim",
      config = function()
        require("hop").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader><cr>", "<cmd>HopWord<cr>")
      end,
      cmd = { "HopWord" },
    })

    -- index: i

    use({
      "lewis6991/impatient.nvim",
    })

    use({
      "lukas-reineke/indent-blankline.nvim",
      after = { "nvim-treesitter" },
      config = function()
        require("indent_blankline").setup({
          filetype_exclude = { "alpha" },
          space_char_blankline = " ",
          show_current_context = true,
        })
      end,
      event = { "VimEnter" },
    })

    use({
      "Darazaki/indent-o-matic",
      config = function()
        require("indent-o-matic").setup({})
      end,
      event = { "VimEnter" },
    })

    use({
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "onsails/lspkind-nvim",
      event = { "VimEnter" },
    })

    use({
      "nvim-lualine/lualine.nvim",
      after = { "catppuccin", "nvim-gps" },
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
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
            lualine_c = { { require("nvim-gps").get_location, cond = require("nvim-gps").is_available } },
            lualine_x = { { "encoding" }, { "fileformat" }, { "filetype", icon_only = true } },
            lualine_y = { { "branch" }, { "diff" }, { "diagnostics" } },
            lualine_z = { { "location" } },
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
    })

    -- index: l

    use({
      "lukas-reineke/lsp-format.nvim",
      config = function()
        require("lsp-format").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      after = { "nvim-lspconfig" },
      config = function()
        require("lsp_lines").setup()
      end,
      setup = function()
        vim.diagnostic.config({
          virtual_text = false,
        })
        vim.keymap.set("n", "<leader>vl", function()
          require("lsp_lines").toggle()
        end)
      end,
    })

    use({
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").init_lsp_saga()
      end,
      setup = function()
        vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<cr>")
        vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
      end,
      cmd = { "Lspsaga" },
    })

    use({
      "L3MON4D3/LuaSnip",
      after = { "friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    })

    -- index: m

    use({
      "williamboman/mason-lspconfig.nvim",
      after = { "mason.nvim" },
    })

    use({
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "mvllow/modes.nvim",
      config = function()
        require("modes").setup()
      end,
      event = { "VimEnter" },
    })

    -- index: n

    use({
      "TimUntersberger/neogit",
      config = function()
        require("neogit").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit<cr>")
      end,
      cmd = { "Neogit" },
    })

    use({
      "nvim-neotest/neotest",
      after = { "nvim-treesitter" },
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-neotest/neotest-go" },
        { "nvim-neotest/neotest-python" },
      },
      config = function()
        require("neotest").setup({
          adapters = {
            require("neotest-go"),
            require("neotest-python"),
          },
        })
      end,
      setup = function()
        vim.keymap.set("n", "<leader>tf", function()
          require("neotest").run.run()
        end)
      end,
      ft = { "go", "python" },
    })

    use({
      "folke/noice.nvim",
      requires = {
        { "MunifTanjim/nui.nvim" },
        { "rcarriga/nvim-notify", opt = true },
      },
      config = function()
        require("noice").setup()
      end,
      event = { "CmdlineEnter" },
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = { "nvim-lspconfig" },
      requires = {
        { "nvim-lua/plenary.nvim" },
      },
      config = function()
        require("null-ls").setup({
          sources = {
            -- diagnostics
            require("null-ls").builtins.diagnostics.flake8,
            require("null-ls").builtins.diagnostics.markdownlint,
            require("null-ls").builtins.diagnostics.protolint,
            require("null-ls").builtins.diagnostics.shellcheck,
            require("null-ls").builtins.diagnostics.zsh,
            -- formatting
            require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.clang_format,
            require("null-ls").builtins.formatting.goimports,
            require("null-ls").builtins.formatting.isort,
            require("null-ls").builtins.formatting.latexindent,
            require("null-ls").builtins.formatting.markdownlint,
            require("null-ls").builtins.formatting.prettier,
            require("null-ls").builtins.formatting.shfmt,
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
    })

    use({
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
      event = { "CmdlineEnter" },
    })

    use({
      "nkakouros-original/numbers.nvim",
      config = function()
        require("numbers").setup({
          excluded_filetypes = {
            "alpha",
            "NvimTree",
            "packer",
            "TelescopePrompt",
            "Trouble",
          },
        })
      end,
      event = { "BufEnter" },
    })

    use({
      "windwp/nvim-autopairs",
      after = { "nvim-cmp" },
      config = function()
        require("nvim-autopairs").setup()
        require("cmp").event:on(
          "confirm_done",
          require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
        )
      end,
    })

    use({
      "hrsh7th/nvim-cmp",
      after = { "lspkind-nvim", "LuaSnip" },
      requires = {
        { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-calc", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-emoji", after = { "nvim-cmp" } },
        { "petertriho/cmp-git", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-nvim-lua", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-path", after = { "nvim-cmp" } },
        { "lukas-reineke/cmp-rg", after = { "nvim-cmp" } },
        { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp" } },
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
    })

    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "yamatsum/nvim-cursorline",
      config = function()
        require("nvim-cursorline").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "mfussenegger/nvim-dap",
      setup = function()
        vim.keymap.set("n", "<leader>b", function()
          require("dap").toggle_breakpoint()
        end)
      end,
      event = { "VimEnter" },
    })

    use({
      "rcarriga/nvim-dap-ui",
      after = { "nvim-dap" },
      config = function()
        require("dapui").setup()
      end,
    })

    use({
      "booperlv/nvim-gomove",
      config = function()
        require("gomove").setup({
          map_defaults = false,
        })
      end,
      setup = function()
        vim.keymap.set("n", "<m-left>", "<plug>GoNSMLeft")
        vim.keymap.set("n", "<m-down>", "<plug>GoNSMDown")
        vim.keymap.set("n", "<m-right>", "<plug>GoNSMRight")
        vim.keymap.set("n", "<m-up>", "<plug>GoNSMUp")

        vim.keymap.set("v", "<m-left>", "<plug>GoVSMLeft")
        vim.keymap.set("v", "<m-down>", "<plug>GoVSMDown")
        vim.keymap.set("v", "<m-right>", "<plug>GoVSMRight")
        vim.keymap.set("v", "<m-up>", "<plug>GoVSMUp")
      end,
      event = { "VimEnter" },
    })

    use({
      "SmiteshP/nvim-gps",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-gps").setup()
      end,
    })

    use({
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
      end,
      event = { "CmdLineEnter" },
    })

    use({
      "Iron-E/nvim-libmodal",
      event = { "VimEnter" },
    })

    use({
      "neovim/nvim-lspconfig",
      after = { "cmp-nvim-lsp", "lsp-format.nvim", "lsp_signature.nvim", "mason-lspconfig.nvim" },
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "bashls",
            "clangd",
            "dockerls",
            "gopls",
            "jsonls",
            "pyright",
            "sumneko_lua",
            "terraformls",
            "tsserver",
            "vimls",
          },
        })

        require("mason-lspconfig").setup_handlers({
          function(server)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local on_attach = function(client, buffer)
              require("lsp-format").on_attach(client)

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

            if server == "sqls" then
              opts.on_attach = function(client, buffer)
                on_attach(client, buffer)
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
              end
            end

            if server == "sumneko_lua" then
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

            if server == "tsserver" then
              opts.on_attach = function(client, buffer)
                on_attach(client, buffer)
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
              end
            end

            require("lspconfig")[server].setup(opts)
          end,
        })
      end,
      setup = function()
        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")
      end,
    })

    use({
      "rcarriga/nvim-notify",
      after = { "telescope.nvim" },
      config = function()
        vim.notify = require("notify")
      end,
      setup = function()
        vim.keymap.set("n", "<leader>nf", function()
          require("telescope").extensions.notify.notify()
        end)
      end,
    })

    use({
      "dstein64/nvim-scrollview",
      event = { "VimEnter" },
    })

    use({
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "nguyenvukhang/nvim-toggler",
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
      setup = function()
        vim.keymap.set({ "n", "v" }, "<leader>tg", require("nvim-toggler").toggle)
      end,
      event = { "CursorMoved" },
    })

    use({
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("toggleterm").setup({ open_mapping = "<c-t>t", direction = "float" })
      end,
      keys = { "<c-t>t" },
    })

    use({
      "xiyaowong/nvim-transparent",
      config = function()
        require("transparent").setup()
      end,
      cmd = { "TransparentToggle" },
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        require("nvim-tree").setup({
          reload_on_bufenter = true,
          diagnostics = { enable = true },
          git = { ignore = false },
          view = {
            width = 40,
            mappings = {
              custom_only = true,
              list = {
                { key = { "<cr>" }, action = "edit" },
                { key = { "l" }, action = "cd" },
                { key = { "<c-v>" }, action = "vsplit" },
                { key = { "<c-x>" }, action = "split" },
                { key = { "<c-t>" }, action = "tabnew" },
                { key = { "<" }, action = "prev_sibling" },
                { key = { ">" }, action = "next_sibling" },
                { key = { "P" }, action = "parent_node" },
                { key = { "<bs>" }, action = "close_node" },
                { key = { "<s-cr>" }, action = "close_node" },
                { key = { "<tab>" }, action = "preview" },
                { key = { "K" }, action = "first_sibling" },
                { key = { "J" }, action = "last_sibling" },
                { key = { "I" }, action = "toggle_ignored" },
                { key = { "H" }, action = "toggle_dotfiles" },
                { key = { "R" }, action = "refresh" },
                { key = { "a" }, action = "create" },
                { key = { "d" }, action = "remove" },
                { key = { "r", "<f2>" }, action = "rename" },
                { key = { "<c-r>" }, action = "full_rename" },
                { key = { "x" }, action = "cut" },
                { key = { "c" }, action = "copy" },
                { key = { "p" }, action = "paste" },
                { key = { "y" }, action = "copy_name" },
                { key = { "Y" }, action = "copy_path" },
                { key = { "gy" }, action = "copy_absolute_path" },
                { key = { "[c}" }, action = "prev_git_item" },
                { key = { "]c}" }, action = "next_git_item" },
                { key = { "h" }, action = "dir_up" },
                { key = { "o" }, action = "system_open" },
                { key = { "f" }, action = "live_filter" },
                { key = { "F" }, action = "clear_live_filter" },
                { key = { "q" }, action = "close" },
                { key = { "g?" }, action = "toggle_help" },
              },
            },
          },
        })
      end,
      setup = function()
        vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")
      end,
      cmd = { "NvimTreeToggle" },
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = { ":TSUpdate" },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "bash",
            "bibtex",
            "c",
            "c_sharp",
            "cmake",
            "comment",
            "cpp",
            "css",
            "cuda",
            "dockerfile",
            "dot",
            "fish",
            "go",
            "gomod",
            "gowork",
            "graphql",
            "hcl",
            "html",
            "http",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "json5",
            "jsonc",
            "julia",
            "kotlin",
            "latex",
            "llvm",
            "lua",
            "make",
            "markdown",
            "ninja",
            "nix",
            "perl",
            "php",
            "proto",
            "python",
            "r",
            "regex",
            "rst",
            "ruby",
            "rust",
            "scala",
            "scss",
            "swift",
            "todotxt",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vue",
            "yaml",
            "zig",
          },
          highlight = { enable = true },
        })
      end,
      event = { "VimEnter" },
    })

    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = { "nvim-treesitter" },
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
    })

    use({
      "p00f/nvim-ts-rainbow",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup({ rainbow = { enable = true } })
      end,
    })

    use({
      "kyazdani42/nvim-web-devicons",
    })

    use({
      "haringsrob/nvim_context_vt",
      after = { "nvim-treesitter" },
      setup = function()
        vim.keymap.set("n", "<leader>ct", "<cmd>NvimContextVtToggle<cr>")
      end,
    })

    -- index: o

    use({
      "pwntester/octo.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
      },
      config = function()
        require("octo").setup()
      end,
      cmd = { "Octo" },
    })

    -- index: p

    use({
      "wbthomason/packer.nvim",
      setup = function()
        vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>")
        vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>")
        vim.keymap.set("n", "<leader>pt", "<cmd>PackerStatus<cr>")
      end,
    })

    use({
      "nvim-treesitter/playground",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup({ playground = { enable = true } })
      end,
    })

    -- index: r

    use({
      "tversteeg/registers.nvim",
      keys = { '"' },
    })

    -- index: t

    use({
      "nvim-telescope/telescope-frecency.nvim",
      after = { "telescope.nvim" },
      requires = {
        { "tami5/sqlite.lua" },
      },
      config = function()
        require("telescope").load_extension("frecency")
      end,
      setup = function()
        vim.keymap.set("n", "<leader>fc", function()
          require("telescope").extensions.frecency.frecency()
        end)
      end,
    })

    use({
      "nvim-telescope/telescope-ghq.nvim",
      after = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension("ghq")
      end,
    })

    use({
      "helmecke/telescope-git-worktree.nvim",
      after = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension("git_worktree")
      end,
    })

    use({
      "nvim-telescope/telescope-github.nvim",
      after = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension("gh")
      end,
    })

    use({
      "benfowler/telescope-luasnip.nvim",
      after = { "telescope.nvim" },
      config = function()
        require("telescope").load_extension("luasnip")
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      after = { "nvim-lspconfig" },
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
        { "nvim-lua/plenary.nvim" },
      },
      setup = function()
        vim.keymap.set("n", "<leader><leader>", function()
          require("telescope.builtin").buffers()
        end)
        vim.keymap.set("n", "<leader>ff", function()
          require("telescope.builtin").find_files({ hidden = true })
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
      event = { "VimEnter" },
    })

    use({
      "folke/trouble.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        require("trouble").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>")
      end,
      cmd = { "TroubleToggle" },
    })

    use({
      "Pocco81/true-zen.nvim",
      config = function()
        require("true-zen").setup()
      end,
      cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist", "TZNarrow" },
    })

    -- index: u

    use({
      "axieax/urlview.nvim",
      config = function()
        require("urlview").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>uv", "<cmd>UrlView<cr>")
      end,
      cmd = { "UrlView" },
    })

    -- index: v

    use({
      "tanvirtin/vgit.nvim",
      config = function()
        require("vgit").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gh", "<cmd>VGit buffer_history_preview<cr>")
      end,
      cmd = { "VGit" },
    })

    use({
      "heavenshell/vim-pydocstring",
      run = { "make install" },
      setup = function()
        vim.keymap.set("n", "<leader>ds", "<cmd>Pydocstring<cr>")

        vim.g.pydocstring_enable_mapping = false
        vim.g.pydocstring_formatter = "google"
      end,
      ft = { "python" },
    })

    use({
      "segeljakt/vim-silicon",
      cmd = { "Silicon" },
    })

    use({
      "dstein64/vim-startuptime",
      cmd = { "StartupTime" },
    })

    -- index: z

    use({
      "yuki-yano/zero.nvim",
      config = function()
        require("zero").setup()
      end,
      keys = { "0" },
    })
  end,
})
