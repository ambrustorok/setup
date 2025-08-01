-- ~/.config/nvim/lua/plugins.lua
return {
    -- LSP configuration
    {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').pyright.setup{}
        end
    },
    -- Nvim-Tree configuration
    {
        'nvim-tree/nvim-tree.lua',
        version = "*",
        lazy = false, -- make sure we load this during startup if it is your main file explorer
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require("nvim-tree").setup({
                -- Your configuration options here
            })
        end,
    },
}
