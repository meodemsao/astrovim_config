local utils = require "astronvim.utils"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "pyright", "ruff_lsp" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      -- opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "isort", "black", "pylint" })
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "isort", "black" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "python") end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = {
      search_venv_managers = true,
      search_workspace = true,
      search = true,
      name = {"venv", ".venv"},
      fd_binary_name = "fdfind",
    },
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    -- This is needed for pylint to work in a virtualenv. See https://github.com/williamboman/mason.nvim/issues/668#issuecomment-1320859097
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
    },
  },
}
