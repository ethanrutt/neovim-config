return {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    config = function()
        -- document existing key chains
        require('which-key').register {
            ['<leader>c'] = { name = '[C]ode / Quickfix', _ = 'which_key_ignore' },
            ['<leader>d'] = { name = '[D]ocument / delete to void register', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
            ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        }
    end
}

