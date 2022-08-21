require("nvim-autopairs").setup()
require("nvim-web-devicons").setup()
require("telescope").setup()
require("nvim-tree").setup()
require("bufferline").setup {
    animation = false,
    auto_hide = true,
    maximum_padding = 0,
    maximum_length = 16
}

local nvim_tree_events = require("nvim-tree.events")
local bufferline_state = require("bufferline.state")

local function get_tree_size() return require"nvim-tree.view".View.width end

nvim_tree_events.subscribe("TreeOpen", function()
    bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
    bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose",
                           function() bufferline_state.set_offset(0) end)

vim.cmd([[
    let g:vsnip_filetypes = {}
    let g:vsnip_filetypes.cpp = ['cpp']
]])
