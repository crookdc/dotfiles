-- VIM setup
vim.o.title = true
vim.o.number = true
vim.o.autoindent = true
vim.o.termguicolors = true

local nerdtree = vim.api.nvim_create_augroup("nerdtree", {})
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup,
	command = "NERDTree",
})

-- Plugins 
require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup()

-- Language servers
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer")

-- Autocompletion with nvim-cmp
local cmp = require("cmp")
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
	documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
      ['<Tab>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
	    { name = 'nvim_lsp' },
	    { name = 'vsnip' }, -- For vsnip users.
    }, {
	    { name = 'buffer' },
    })
  })

  require("lualine").setup()

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
  vim.cmd "nmap <leader>d :NERDTreeToggle<CR> | wincmd p"

  vim.g.material_style = "darker"
  vim.cmd "colorscheme material"
  vim.cmd 'autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif'
