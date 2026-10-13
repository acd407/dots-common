-- nftables filetype detection (replaces vim-nftables' ftdetect).
-- Extension/filename maps are checked before Neovim's generic `conf`
-- content fallback, which would otherwise claim *.nft / nftables.conf.
vim.filetype.add({
    extension = {
        nft = "nftables",
    },
    filename = {
        ["nftables.conf"] = "nftables",
    },
})
