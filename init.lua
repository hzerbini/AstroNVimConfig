return {
  header = {
    "█▄█ ▄▀█ █░█ █▀█",
    "░█░ █▀█ █▀█ █▀▀",
  },

  colorscheme = "dracula",
  mappings = {
    n = {
      ["<leader><CR>"] = { "<cmd>.!zsh<CR>", desc = "Exexute line in terminal and return value" },
      ["<A-j>"] = { "<cmd>MoveLine(1)<CR>", desc = "Move line down" },
      ["<A-k>"] = { "<cmd>MoveLine(-1)<CR>", desc = "Move line up" },
      ["<A-h>"] = { "<cmd>MoveHChar(-1)<CR>", desc = "Move character left" },
      ["<A-l>"] = { "<cmd>MoveHChar(1)<CR>", desc = "Move character right" },
    },
    v = {
      ["<A-j>"] = { ":MoveBlock(1)<CR>", desc = "Move block down" },
      ["<A-k>"] = { ":MoveBlock(-1)<CR>", desc = "Move block up" },
      ["<A-h>"] = { ":MoveHBlock(-1)<CR>", desc = "Move characters left" },
      ["<A-l>"] = { ":MoveHBlock(1)<CR>", desc = "Move characters right" },
    },
  },
  lsp = {
    skip_setup = { "tsserver" },
    formatting = {
      format_on_save = false,
    },
  },
  plugins = {
    init = {
      {
        "fedepujol/move.nvim",
      },
      {
        "Mofiqul/dracula.nvim",
        as = "dracula",
        config = function() require("dracula").setup {} end,
      },
      {
        "jose-elias-alvarez/typescript.nvim",
        after = "mason-lspconfig.nvim",
        config = function()
          require("typescript").setup {
            server = astronvim.lsp.server_settings "tsserver",
          }
        end,
      },
      {
        "simrat39/rust-tools.nvim",
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer", -- get the server settings and built in capabilities/on_attach
          }
        end,
      },
    },
    ["mason-lspconfig"] = {
      ensure_installed = { "tsserver", "rust_analyzer" },
    },
  },
}
