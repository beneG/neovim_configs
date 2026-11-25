------------------------------------------------------------
-- BASIC OPTIONS
------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable space default behavior
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.showmode = false

vim.o.background = "dark"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.undofile = true


vim.api.nvim_create_augroup("highlight_yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "highlight_yank",
  pattern = "*",
  callback = function()
    vim.highlight.hl_op({
      higroup = "IncSearch",
      timeout = 700,
    })
  end,
})

------------------------------------------------------------
-- RESTORE CURSOR POSITION
------------------------------------------------------------
--vim.o.shada = "'100,<50,s10,h"
--vim.api.nvim_create_autocmd("BufReadPost", {
--  callback = function()
--    local last_pos = vim.fn.line("'\"")
--    if last_pos >= 1 and last_pos <= vim.fn.line("$") then
--      vim.cmd('normal! g`"')
--    end
--  end,
--})
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local ft = vim.bo.filetype

    if vim.bo.buftype ~= "" then
      return
    end

    if ft == "gitcommit" or ft == "gitrebase" then
      return
    end

    local last_pos = vim.fn.line("'\"")
    if last_pos >= 1 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"zvzz')
      --pcall(vim.cmd, 'normal! g`"zvzz')
      --pcall(vim.cmd, 'normal! g`"')
    end
  end,
})

------------------------------------------------------------
-- LAZY.NVIM BOOTSTRAP
------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------
-- TURN OFF NETRW
------------------------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

------------------------------------------------------------
-- LSP CAPABILITIES
------------------------------------------------------------
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
--if ok then
--  capabilities = cmp_lsp.default_capabilities(capabilities)
--end

------------------------------------------------------------
-- LSP SETUP (NEW API + FALLBACK)
------------------------------------------------------------
--if vim.lsp.config then
--  -- Neovim 0.11+
--  vim.lsp.config.clangd = {
--    cmd = {
--      "clangd",
--      "--background-index",
--      "--clang-tidy",
--      "--header-insertion=iwyu",
--      "--completion-style=detailed",
--      "--function-arg-placeholders",
--      "--fallback-style=llvm",
--      "--pch-storage=memory",
--      "--all-scopes-completion",
--      "--suggest-missing-includes",
--      "--cross-file-rename",
--    },
--    capabilities = capabilities,
--    filetypes = { "c", "cpp", "cc" },
--  }
--else
--  -- Old API
--  require("lspconfig").clangd.setup({
--    capabilities = capabilities,
--  })
--end



------------------------------------------------------------
-- PLUGINS
------------------------------------------------------------
require("lazy").setup({
  spec = {

    --------------------------------------------------------
    -- THEME
    --------------------------------------------------------
    { "ellisonleao/gruvbox.nvim", priority = 1000 },

    --------------------------------------------------------
    -- RUSCMD
    --------------------------------------------------------
    {
      "aveplen/ruscmd.nvim",
      config = function()
        require("ruscmd").setup({})
      end,
    },

    --------------------------------------------------------
    -- STATUSLINE
    --------------------------------------------------------
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
          options = {
            theme = "gruvbox",
            disabled_filetypes = {
              statusline = { "NvimTree" },
            },
          },
          sections = {
            lualine_x = {
              {
                function()
                  local reg = vim.fn.reg_recording()
                  if reg ~= "" then
                    return "● REC @" .. reg
                  end
                  return ""
                end,
                color = { fg = "#fb4934", gui = "bold" },
              },
              "encoding",
              "fileformat",
              "filetype",
            },
          },
        })
      end,
    },


    --------------------------------------------------------
    -- ALPHA
    --------------------------------------------------------
    {
      "goolord/alpha-nvim",
      event = "VimEnter",
      dependencies = { "ozthemagician/alpha-cowsays-nvim" },
      config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")
        local cow = require("alpha-cowsays-nvim")

        math.randomseed(os.time())
        startify.section.header.val = cow.cowsays()

        alpha.setup(startify.config)
      end,
    },

    --------------------------------------------------------
    -- TREESITTER (FIXED)
    --------------------------------------------------------
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
        ensure_installed = { "c", "cpp", "lua", "python", "regex" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      },
    },
    ---------------------------------
    --{
    --  "nvim-treesitter/nvim-treesitter",
    --  build = ":TSUpdate",
    --  config = function(_, opts)
    --    require("nvim-treesitter.configs").setup(opts)
    --  end,
    --  opts = {
    --    ensure_installed = { "c", "cpp", "lua", "python", "regex" },
    --    auto_install = true,
    --    highlight = { enable = true },
    --    indent = { enable = true },
    --  },
    --},
    ---------------------------------
    --{
    --  "nvim-treesitter/nvim-treesitter",
    --  build = ":TSUpdate",
    --  config = function(_, opts)
    --    require("nvim-treesitter.configs").setup(opts)
    --  end,
    --  opts = {
    --    ensure_installed = { "c", "cpp", "lua", "python", "regex" },
    --    auto_install = true,
    --    highlight = { enable = true },
    --    indent = { enable = true },
    --  },
    --},
    ---------------------------------
    --{
    --  "nvim-treesitter/nvim-treesitter",
    --  build = ":TSUpdate",
    --  event = { "BufReadPost", "BufNewFile" },  -- ← загружать при открытии файла
    --  config = function(_, opts)
    --    require("nvim-treesitter.configs").setup(opts)
    --  end,
    --  opts = { ... },
    --},






    --------------------------------------------------------
    -- TELESCOPE
    --------------------------------------------------------
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      },
      config = function()
        require("telescope").setup({})
        vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
      end,
    },

    --------------------------------------------------------
    -- LSP / MASON
    --------------------------------------------------------
    { "neovim/nvim-lspconfig" },
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end,
    },
    --{
    --  "williamboman/mason-lspconfig.nvim",
    --  config = function()

    --    ------------------------------------------------------------
    --    -- LSP CAPABILITIES
    --    ------------------------------------------------------------
    --    local capabilities = vim.lsp.protocol.make_client_capabilities()
    --    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    --    if ok then
    --      capabilities = cmp_lsp.default_capabilities(capabilities)
    --    end

    --    require("mason-lspconfig").setup({
    --      ensure_installed = { "clangd", "pyright", "lua_ls" },
    --      handlers = {
    --        function(server_name)
    --          require("lspconfig")[server_name].setup({ capabilities = capabilities })
    --        end,
    --      },
    --    })
    --  end,
    --},
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        -- capabilities теперь здесь
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
        if ok then
          capabilities = cmp_lsp.default_capabilities(capabilities)
        end

        require("mason-lspconfig").setup({
          ensure_installed = { "clangd", "pyright", "lua_ls" },
          handlers = {
            -- дефолтный хендлер для всех остальных серверов
            function(server_name)
              require("lspconfig")[server_name].setup({ capabilities = capabilities })
            end,

            -- === clangd: всё что было в vim.lsp.config ===
            ["clangd"] = function()
              require("lspconfig").clangd.setup({
                capabilities = capabilities,
                cmd = {
                  "clangd",
                  "--background-index",
                  "--clang-tidy",
                  "--header-insertion=iwyu",
                  "--completion-style=detailed",
                  "--function-arg-placeholders",
                  "--fallback-style=llvm",
                  "--pch-storage=memory",
                  "--all-scopes-completion",
                  "--suggest-missing-includes",
                  "--cross-file-rename",
                },
                filetypes = { "c", "cpp", "cc" },
              })
            end,

            -- === lua_ls: убираем "Undefined global vim" ===
            ["lua_ls"] = function()
              require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = { "vim" },
                    },
                    workspace = {
                      --library = vim.api.nvim_get_runtime_file("", true),
                      library = { vim.env.VIMRUNTIME },
                      checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                  },
                },
              })
            end,
          },
        })
      end,
    },



    --------------------------------------------------------
    -- friendly-snippets
    --------------------------------------------------------
    {
      "rafamadriz/friendly-snippets",
      dependencies = { "L3MON4D3/LuaSnip" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },


    --------------------------------------------------------
    -- CMP
    --------------------------------------------------------
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
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
            completion = cmp.config.window.bordered({
              border = "rounded",
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            }),
            documentation = cmp.config.window.bordered({
              border = "rounded",
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            }),
          },

          --mapping = cmp.mapping.preset.insert({
          --  ["<CR>"] = cmp.mapping.confirm({ select = true }),
          --  ["<Tab>"] = cmp.mapping.select_next_item(),
          --  ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          --}),
-----------------------------------
          mapping = cmp.mapping.preset.insert({
            ["<CR>"] = cmp.mapping.confirm({ select = true }),

            -- УМНЫЙ Tab: меню cmp → tabstop сниппета → обычный Tab
            --["<Tab>"] = cmp.mapping(function(fallback)
            --  if cmp.visible() then
            --    cmp.select_next_item()                    -- в меню cmp
            --  elseif luasnip.expand_or_jumpable() then
            --    luasnip.expand_or_jump()                  -- внутри сниппета
            --  else
            --    fallback()                                 -- обычный Tab
            --  end
            --end, { "i", "s" }),  -- i = insert, s = select (режим сниппета)
-------------
            ["<Tab>"] = cmp.mapping(function(fallback)
              if luasnip.expand_or_locally_jumpable() then   -- ← СНАЧАЛА сниппет
                luasnip.expand_or_jump()
              elseif cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end, { "i", "s" }),
-------------
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)                          -- назад по tabstop'ам
              else
                fallback()
              end
            end, { "i", "s" }),
          }),

------------------------------
          sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          },
        })
      end,
    },


    --------------------------------------------------------
    -- nvim surround
    --------------------------------------------------------
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
        -- config = function()
        --     require("nvim-surround").setup({
        --         -- Put your configuration here
        --     })
        -- end
    },

    --------------------------------------------------------
    -- noice
    --------------------------------------------------------
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      config = function()
        require("noice").setup({
          lsp = {
            -- Переопределение messages
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
            signature = {
              --enabled = false, -- Можно включить красивую сигнатуру
              enabled = true,
              auto_open = {
                  enabled = true,
                  trigger = true,
                  luasnip = true,
                  throttle = 50,
              },
            },
            hover = {
              enabled = true,
              view = "popup", -- или "hover"
              opts = {
                focusable = true,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "Esc" },
              },
            },
          },
          presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = "rounded", -- Скругленные границы
          },
          views = {
            popup = {
              border = {
                style = "rounded",
                padding = { 0, 1 },
              },
            },
            hover = {
              border = {
                style = "rounded",
              },
            },
          },

        })
      end
    },

    --------------------------------------------------------
    -- nvim-tree
    --------------------------------------------------------
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    --------------------------------------------------------
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    --------------------------------------------------------
    {
      "stevearc/conform.nvim",
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            c   = { "clang_format" },
            cpp = { "clang_format" },
          },
          -- format_on_save убрали
        })
        vim.keymap.set({ "n", "v" }, "=", function()
          require("conform").format({ async = true })
        end, { desc = "Format with clang-format" })
      end,
    },

    --------------------------------------------------------
    {
      "p00f/clangd_extensions.nvim",
      config = function()
        require("clangd_extensions").setup({
          inlay_hints = { inline = true },  -- показывает типы переменных inline
          ast = { enabled = true },         -- AST viewer
        })
        -- Дополнительные кейбайды
        vim.keymap.set("n", "<leader>ch", ":ClangdSwitchSourceHeader<CR>")  -- .h ↔ .cpp
        vim.keymap.set("n", "<leader>ct", ":ClangdTypeHierarchy<CR>")
      end,
    },

    --------------------------------------------------------
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
    --------------------------------------------------------





  },
})


------------------------------------------------------------
-- DIAGNOSTICS
------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  severity_sort = true,
  float = { border = "rounded" },
})

------------------------------------------------------------
-- LSP KEYMAPS
------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    --vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    --vim.lsp.semantic_tokens.start(ev.buf, ev.data.client_id)
  end,
})

--vim.lsp.semantic_tokens.enable(true)
--vim.lsp.semantic_tokens.start(ev.buf, ev.data.client_id)

------------------------------------------------------------
-- COLORS
------------------------------------------------------------
vim.cmd.colorscheme("gruvbox")



------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true

local numbergroup = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
    pattern = "*",
    callback = function()
        if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
            vim.wo.relativenumber = true
        end
    end,
    group = numbergroup,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
    pattern = "*",
    callback = function()
        if vim.wo.number then
            vim.wo.relativenumber = false
        end
    end,
    group = numbergroup,
})
------------------------------------------------------------
vim.opt.cursorline = true



vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { desc = 'List buffers' })

vim.api.nvim_set_hl(0, "FloatBorder", { link = "GruvboxFg3" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3c3836" })



vim.keymap.set("n", "<Esc>", function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_is_valid(win) then
      local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
      if ok and cfg.relative ~= "" then
        vim.api.nvim_win_close(win, false)
      end
    end
  end
end, { desc = "Close floating windows" })



vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep({
    additional_args = { "--glob", "!.git/" }
  })
end)


vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })


------------------------------------------------------------
-- FIX RUSCMD BROKEN DEFAULT KEYS
------------------------------------------------------------

-- вернуть стандартную repeat-команду
vim.keymap.set("n", ".", ".", { noremap = true })

-- на всякий случай ещё и эти:
vim.keymap.set("n", ";", ";", { noremap = true })
vim.keymap.set("n", ",", ",", { noremap = true })
vim.keymap.set("n", "/", "/", { noremap = true })
vim.keymap.set("n", "?", "?", { noremap = true })























--------------------------------------------------------------
---- RUN CURRENT FILE  (<F5> или <leader>rr)
--------------------------------------------------------------
--local run_buf = nil
--
--local function run_file()
--  local file = vim.fn.expand("%:p")
--  if file == "" then
--    vim.notify("Сначала сохрани файл на диск (:w имя)", vim.log.levels.WARN)
--    return
--  end
--
--  vim.cmd("silent! write")
--
--  local ft = vim.bo.filetype
--
--  -- Lua запускаем внутри самого Neovim
--  if ft == "lua" then
--    vim.cmd("luafile " .. vim.fn.fnameescape(file))
--    return
--  end
--
--  local f = vim.fn.shellescape(file)
--  local dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))
--  local out = vim.fn.shellescape(vim.fn.tempname())
--
--  -- Добавляй свои языки сюда
--  local runners = {
--    python     = "python3 " .. f,
--    sh         = "bash " .. f,
--    bash       = "bash " .. f,
--    javascript = "node " .. f,
--    c          = ("clang -Wall -g %s -o %s && %s"):format(f, out, out),
--    cpp        = ("clang++ -std=c++23 -Wall -g %s -o %s && %s"):format(f, out, out),
--  }
--
--  local cmd = runners[ft]
--  if not cmd then
--    vim.notify("Нет раннера для filetype: '" .. ft .. "'", vim.log.levels.WARN)
--    return
--  end
--
--  -- закрыть прошлый запуск
--  if run_buf and vim.api.nvim_buf_is_valid(run_buf) then
--    vim.api.nvim_buf_delete(run_buf, { force = true })
--  end
--
--  vim.cmd("botright 15split")
--  vim.cmd("terminal cd " .. dir .. " && " .. cmd)
--  run_buf = vim.api.nvim_get_current_buf()
--  vim.bo[run_buf].bufhidden = "wipe"
--  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = run_buf, silent = true, desc = "Close run window" })
--  vim.cmd("stopinsert")
--end
--
--vim.keymap.set("n", "<F5>", run_file, { desc = "Run current file" })
--vim.keymap.set("n", "<leader>rr", run_file, { desc = "Run current file" })






------------------------------------------------------------
-- RUN CURRENT FILE  (<F5> или <leader>rr)
------------------------------------------------------------
local run_buf = nil

local function run_file()
  local file = vim.fn.expand("%:p")
  if file == "" then
    vim.notify("Сначала сохрани файл на диск (:w имя)", vim.log.levels.WARN)
    return
  end

  vim.cmd("silent! write")

  local ft = vim.bo.filetype

  -- Lua запускаем внутри самого Neovim
  if ft == "lua" then
    vim.cmd("luafile " .. vim.fn.fnameescape(file))
    return
  end

  local f = vim.fn.shellescape(file)
  local dir = vim.fn.shellescape(vim.fn.expand("%:p:h"))
  local out = vim.fn.shellescape(vim.fn.tempname())

  -- Добавляй свои языки сюда
  local runners = {
    python     = "python3 " .. f,
    sh         = "bash " .. f,
    bash       = "bash " .. f,
    javascript = "node " .. f,
    c          = ("clang -Wall -g %s -o %s && %s"):format(f, out, out),
    cpp        = ("clang++ -std=c++23 -Wall -g %s -o %s && %s"):format(f, out, out),
  }

  local cmd = runners[ft]
  if not cmd then
    vim.notify("Нет раннера для filetype: '" .. ft .. "'", vim.log.levels.WARN)
    return
  end

  -- закрыть прошлый запуск
  if run_buf and vim.api.nvim_buf_is_valid(run_buf) then
    vim.api.nvim_buf_delete(run_buf, { force = true })
  end

  vim.cmd("botright 15split")
  -- после завершения программы ждём Enter, чтобы вывод не исчезал сам по себе
  local script = "cd " .. dir .. " && " .. cmd
    .. "; code=$?; printf '\\n[Код возврата: '\"$code\"'. Enter - закрыть] '; read _"
  vim.cmd("terminal sh -c " .. vim.fn.shellescape(script))
  run_buf = vim.api.nvim_get_current_buf()
  vim.bo[run_buf].bufhidden = "wipe"
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = run_buf, silent = true, desc = "Close run window" })

  -- когда программа завершилась, выходим в normal-режим:
  -- вывод остаётся на экране, а окно закрывается только по `q`
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = run_buf,
    once = true,
    callback = function()
      vim.schedule(function() vim.cmd("stopinsert") end)
    end,
  })

  -- пока программа работает, ввод должен идти в неё (input / std::cin)
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<F5>", run_file, { desc = "Run current file" })
vim.keymap.set("n", "<leader>rr", run_file, { desc = "Run current file" })
