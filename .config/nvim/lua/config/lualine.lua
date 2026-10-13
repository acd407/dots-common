require('lualine').setup {
    options = {
        disabled_filetypes = {
            'Avante',
            'AvanteConfirm',
            'AvanteInput',
            'AvantePromptInput',
            'AvanteSelectedFiles',
            'AvanteTodos',
        },
        theme = 'onedark',
    },
    extensions = {
        'lazy',
        'man',
        {
            sections = {
                lualine_a = { function()
                    return "FILES"
                end }
            },
            filetypes = { 'NvimTree' },
        }
    },
}