-- tree-sitter-manager only merges custom `languages` for manual installs;
-- `ensure_installed` and `auto_install` look the language up in the built-in
-- `repos` table, so pre-register the parser there to make auto-install work.
require("tree-sitter-manager.repos").nftables = {
    install_info = {
        url = "https://github.com/acd407/tree-sitter-nftables.git",
        generate = true,         -- generated parser is not checked into the repo
        use_repo_queries = true, -- use queries/ (highlights, injections) from the repo
    },
}

require("tree-sitter-manager").setup()
