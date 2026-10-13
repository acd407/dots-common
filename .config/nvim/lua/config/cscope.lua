local cscope_maps = require("cscope_maps")
cscope_maps.setup {
    disable_maps = false,
    skip_input_prompt = false,
    prefix = "<space>c",

    cscope = {
        db_file = "./cscope.out",
        exec = "cscope",
        picker = "snacks",
        qf_window_size = 5,
        qf_window_pos = "bottom",
        skip_picker_for_single_result = true,
        db_build_cmd = { script = "default", args = { "-bqkv" } },
        statusline_indicator = nil,
        project_rooter = {
            enable = false,
            change_cwd = false,
        },
    },

    stack_view = {
        tree_hl = true,
    }
}
vim.keymap.set("n", "<space>st", function() cscope_maps.cscope_prompt("s") end)
vim.keymap.del({ 'n', 'v' }, '<C-]>')