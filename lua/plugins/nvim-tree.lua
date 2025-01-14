return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            log = {
                enable = true,
                truncate = true,
                types = {
                    diagnostics = true,
                },
            },
        })
        vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")
    end,
}
