vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        _G.dd = function(...)
            Snacks.debug.inspect(...)
        end
        _G.bt = function()
            Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<space>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<space>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<space>uL")
        Snacks.toggle.diagnostics():map("<space>ud")
        Snacks.toggle.line_number():map("<space>ul")
        Snacks.toggle.option("conceallevel",
            { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<space>uc")
        Snacks.toggle.treesitter():map("<space>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
            "<space>ub")
        Snacks.toggle.inlay_hints():map("<space>uh")
        Snacks.toggle.indent():map("<space>ug")
        Snacks.toggle.dim():map("<space>uD")
    end,
})

require("snacks").setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    notifier = {
        enabled = false,
        timeout = 5000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {
        notification = {}
    }
})

vim.keymap.set("n", "<space><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<space>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<space>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<space>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<space>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<space>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<space>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<space>gF", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<space>gf", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<space>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<space>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<space>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<space>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<space>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<space>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
vim.keymap.set("n", "<space>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<space>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set('n', '<space>"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set('n', '<space>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<space>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<space>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<space>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<space>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<space>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<space>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<space>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<space>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<space>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<space>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<space>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<space>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<space>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
