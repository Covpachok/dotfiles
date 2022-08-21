return require("packer").startup(function()
    -- essential things
    use "wbthomason/packer.nvim"
    use "gruvbox-community/gruvbox"
    use "nvim-lua/plenary.nvim"

    -- lsp things
    use "ray-x/lsp_signature.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-treesitter/nvim-treesitter"

    -- completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- snippets
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "rafamadriz/friendly-snippets"

    -- makes life easier
    use "windwp/nvim-autopairs"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"
    use "rhysd/vim-clang-format"
    use "andrejlevkovitch/vim-lua-format"
    use "sbdchd/neoformat"
    use "easymotion/vim-easymotion"
    use "nvim-telescope/telescope.nvim"
    use "preservim/vimux"
    use "kyazdani42/nvim-tree.lua"
    use "romgrk/barbar.nvim"

    -- beautiful things
    use "kyazdani42/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
end)
