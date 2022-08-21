local api = vim.api
local function map(m, k, v)
    api.nvim_set_keymap(m, k, v, {noremap = true, silent = true})
end

-- local cmd = vim.cmd
-- cmd([[
-- autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
-- autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
-- ]])

-- map("n", "<leader>cf", "<CMD>ClangFormat<CR>")
-- clang-format
api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    command = [[nnoremap <silent> <buffer><Leader>cf :<C-u>ClangFormat<CR>]]
})

api.nvim_create_autocmd("FileType", {
    pattern = {"lua"},
    command = [[nnoremap <silent> <buffer><Leader>cf <CMD>call LuaFormat()<CR>]]
})

-- Switch between header & source
api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.cpp"},
    command = [[nnoremap <silent> <leader>s :e %<.hpp<CR>]]
})
api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.hpp"},
    command = [[nnoremap <silent> <leader>s :e %<.cpp<CR>]]
})

api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.cpp"},
    command = [[nnoremap <silent> <leader>vs :leftabove vs %<.hpp<CR>]]
})
api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.hpp"},
    command = [[nnoremap <silent> <leader>vs :rightbelow vs %<.cpp<CR>]]
})

api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.cpp"},
    command = [[nnoremap <silent> <leader>xs :leftabove split %<.hpp<CR>]]
})
api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    pattern = {"*.hpp"},
    command = [[nnoremap <silent> <leader>xs :rightbelow split %<.cpp<CR>]]
})

-- Telescope 
map("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
map("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")

-- Lexplore
-- map("n", "<leader>e", "<CMD>Lexplore<CR>")

-- Tree
map("n", "<A-e>", "<CMD>NvimTreeToggle<CR>")
map("n", "<A-r>", "<CMD>NvimTreeFocus<CR>")

-- Window splitting
map("n", "<A-d>", "<CMD>vsplit<CR><C-w>l")
map("n", "<A-s>", "<CMD>split<CR><C-w>j")
map("n", "<A-w>", "<CMD>wq<CR>")
map("n", "<A-q>", "<CMD>q!<CR>")

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
map("n", "<A-.>", "<CMD>BufferNext<CR>")
map("n", "<A-,>", "<CMD>BufferPrevious<CR>")
map("n", "<A-c>", "<CMD>BufferClose<CR>")

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-1<CR>==")
map("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Easy motion

-- find character
map("n", ".s", "<Plug>(easymotion-overwin-f)")

-- find 2 characters
map("n", ".d", "<Plug>(easymotion-overwin-f2)")

-- global word find
map("n", ".g", "<Plug>(easymotion-overwin-w)")

-- t/f (find character on line)
map("n", ".t", "<Plug>(easymotion-overwin-tl)")
map("n", ".f", "<Plug>(easymotion-overwin-fl)")

-- jk/l motions: Line motions
map("n", ".j", "<Plug>(easymotion-j)")
map("n", ".k", "<Plug>(easymotion-k)")
map("n", "./", "<Plug>(easymotion-overwin-line)")
map("n", ".a", "<Plug>(easymotion-jumptoanywhere)")

-- snippets?
-- vim.cmd([[
--     " Expand
--     imap <expr> <A-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<A-j>'
--     smap <expr> <A-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<A-j>'

--     " Expand or jump
--     imap <expr> <A-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<A-l>'
--     smap <expr> <A-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<A-l>'

--     " Jump forward or backward
--     imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--     smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--     imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--     smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'
-- ]])
