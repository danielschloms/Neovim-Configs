local M = {}

M.dap = {
  n = {
    ["<leader>tb"] = { function () require('dap').toggle_breakpoint() end, "Toggle breakpoint" },
    ["<F5>"] = { function () require('dap').continue() end, "DBG: continue" },
    ["<F10>"] = { function () require('dap').step_over() end, "DBG: step over" },
    ["<F11>"] = { function () require('dap').step_into() end, "DBG: step into" },
    ["<F12>"] = { function () require('dap').step_out() end, "DBG: step out" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.trouble = {
  n = {
    ["<leader>tt"] = { function() require("trouble").open() end, "Toggle trouble" },
    ["<leader>tw"] = { function() require("trouble").open("workspace_diagnostics") end, "Trouble workspace diagnostics" },
    ["<leader>td"] = { function() require("trouble").open("document_diagnostics") end, "Trouble document diagnostics" },
    ["<leader>tq"] = { function() require("trouble").open("quickfix") end, "Trouble quickfix" },
  }
}

return M
