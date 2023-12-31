local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local rt = require("rust-tools")

local options = {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      ["rust_analyzer"] = { cargo = { allFeatures = true } },
    },
    checkOnSave = {
      allFeatures = true,
      overrideCommand = {
        "cargo",
        "clippy",
        "--workspace",
        "--message-format=json",
        "--all-targets",
        "--all-features",
      },
    },
  }
}
