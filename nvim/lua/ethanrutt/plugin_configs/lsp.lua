return function()
    local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end


        --
        -- Telescope Integration
        --
        nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")


        --
        -- Documentation Help
        --
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")


        --
        -- Workspace
        --
        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        nmap("<leader>f", vim.lsp.buf.format, "[F]ormat current buffer")
    end


    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- add more servers when needed
    local servers = {
        bashls = {},
        lua_ls = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                        -- Add other libraries here that you want lsp support for
                        "/usr/share/awesome/lib",
                        "~/.config/awesome",
                    },
                },
                runtime = { version = "LuaJIT" },
            },
        },
        clangd = {},
        cssls = {},
        html = {},
        ts_ls = {},
        ruff = {},
        pyright = {},
        yamlls = {},
        jsonls = {},
        rust_analyzer = {},
    }

    require("lazydev").setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = false,
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
            })
        end,
    })
end
