-- 有独立配置文件的在自己里面配置，其它的和公用的在这个文件

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<C-X>", "<Cmd>Ex<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-Up>", "5k", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-Down>", "5j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-Up>", "5k")
vim.keymap.set({ "n", "v" }, "<C-Down>", "5j")

-- TabPage
-- use alt to move from window
for i = 1, 9 do
    vim.api.nvim_set_keymap(
        "n",
        ("<A-%s>"):format(i),
        -- ("<Cmd>tabn %s<CR>"):format(i),
        ("<Cmd>tabnext %s<CR>"):format(i),
        { silent = true }
    )
end

-- 覆盖 gx 命令
vim.keymap.set("n", "gx", function()
  local cursor_word = vim.fn.expand("<cfile>")
  if cursor_word == "" then
    print("No file/word under cursor")
    return
  end

  -- 获取当前文件所在目录
  local current_file = vim.fn.expand("%:p")
  local current_dir = vim.fn.expand("%:p:h")

  -- 拼接完整路径
  local full_path = current_dir .. "/" .. cursor_word
  full_path = vim.fn.simplify(full_path)  -- 处理 ../ 等

  -- 检查是否存在
  if vim.fn.filereadable(full_path) == 1 or vim.fn.isdirectory(full_path) == 1 then
    -- 根据系统选择合适的打开命令
    local cmd
    if vim.fn.has("macunix") == 1 then
      cmd = "open"
    elseif vim.fn.has("win32") == 1 then
      cmd = "start"
    else
      cmd = "xdg-open"
    end
    vim.cmd("silent !" .. cmd .. " " .. vim.fn.shellescape(full_path) .. " &")
    print("Opening: " .. full_path)
  else
    -- 如果文件不存在，尝试当作 URL 处理
    local url_pattern = "^https?://"
    if cursor_word:match(url_pattern) then
      vim.cmd("silent !xdg-open " .. vim.fn.shellescape(cursor_word) .. " &")
    else
      print("File not found: " .. full_path)
    end
  end
end, { desc = "Open file under cursor with system app (based on current file dir)" })
