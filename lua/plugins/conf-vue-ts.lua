-- 文件路径: ~/.config/nvim/lua/plugins/conf-vue-ts.lua
return {
    {
        "williamboman/mason.nvim", -- Mason.nvim 插件
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim", -- Mason-lspconfig 插件
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig", -- nvim-lspconfig 插件
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_registry = require("mason-registry")
            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
                .. "/node_modules/@vue/language-server"

            lspconfig.tsserver.setup {
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            }
        end,
    },
}
