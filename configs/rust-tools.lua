local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local rt = require("rust-tools")
local mason_registry = require('mason-registry')

local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name
codelldb:get_install_path() -- returns a string like "/home/user/.local/share/nvim/mason/packages/codelldb"

local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local options = {
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    }
  }
}

-- local options = {
--   server = {
--     on_attach = function(_, bufnr)
--       -- Hover actions
--       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--       -- Code action groups
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--     capabilities = require("cmp_nvim_lsp").default_capabilities(),
--     settings = {
--       ["rust_analyzer"] = { cargo = { allFeatures = true } },
--     },
--     checkOnSave = {
--       allFeatures = true,
--       overrideCommand = {
--         "cargo",
--         "clippy",
--         "--workspace",
--         "--message-format=json",
--         "--all-targets",
--         "--all-features",
--       },
--     },
--   }
-- }
