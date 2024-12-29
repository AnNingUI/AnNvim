-- -- 格式化代码

return {
    "stevearc/conform.nvim",
    opts = {
        -- Optional: You can specify custom configuration for conform.nvim here
        -- Note: LazyVim will manage most of the plugin configuration for you
        -- This is where you could potentially specify settings like which formatters to use for different languages
        languages = {
            c = { "clang_format" },
            go = {
                formatters = { "gofumpt", "goimports" },
                run_all_formatters = true,
            },
            html = { "prettier_d" },
            json = { "jq" },
            rust = { "rustfmt" },
            bash = { "shfmt" },
            lua = { "stylua" },

            javascript = { "prettier_d" },
            typescript = { "prettier_d" },
            css = { "prettier_d" },
            scss = { "prettier_d" },
            vue = { "prettier_d" },
            markdown = { "prettier_d" },
            sql = { "sql-formatter" },
            yaml = { "prettier_d" },
            python = {
                formatters = { "isort", "black" },
                run_all_formatters = true,
                format_on_save = false,
            },
            zig = { "zigfmt" },
        },
    },
}
