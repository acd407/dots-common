vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/hrsh7th/vim-vsnip" },

    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/hrsh7th/cmp-vsnip" },

    { src = "https://github.com/hrsh7th/nvim-cmp" },

    { src = "https://github.com/folke/snacks.nvim" },

    { src = "https://github.com/nvim-lualine/lualine.nvim" },

    { src = "https://github.com/nvim-tree/nvim-tree.lua" },

    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },

    { src = "https://github.com/navarasu/onedark.nvim" },

    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    { src = "https://github.com/dhananjaylatkar/cscope_maps.nvim" },

    { src = "https://github.com/NvChad/nvim-colorizer.lua" },

    { src = "https://github.com/folke/which-key.nvim" },

    { src = "https://github.com/numToStr/Comment.nvim" },

    { src = "https://github.com/hat0uma/csvview.nvim" },

    { src = "https://github.com/fei6409/log-highlight.nvim" },

    { src = "https://github.com/HakonHarnes/img-clip.nvim" },
})

require("config.lsp")
require("config.snacks")
require("config.lualine")
require("config.nvimtree")
require("config.tree-sitter-manager")
require("config.onedark")
require("config.cscope")
require("config.colorizer")
require("config.gitsigns")
require("config.whichkey")
require("config.comment")
require("config.csvview")
require("config.loghighlight")
require("config.imgclip")
