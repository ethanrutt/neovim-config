return {
    function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'c_sharp',
                'lua',
                'bash',
                'markdown',
                'json',
                'html',
                'javascript',
                'css',
                'python',
                'java',
                'rust',
                'yaml',
                'doxygen',
                'git_config',
                'git_rebase',
                'diff',
                'gitattributes',
                'gitcommit',
                'gitignore',
                'dockerfile',
                'kotlin',
                'regex',
                'sql',
                'vimdoc',
            },

            auto_install = false,

            sync_install = false,

            highlight = { enable = true },
            indent = { enable = true },
            textobjects = {
                move = {
                    enable = true,

                    -- whether to set jumps in the jumplist
                    set_jumps = true,
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                },
            },
        })
    end
}
