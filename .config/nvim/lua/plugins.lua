-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()
--
--
--
-- 插件配置{{{
return require('packer').startup(function()
  -- Packer can manage itself
  -- use 'wbthomason/packer.nvim'
  -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'
  -- Lazy loading:
  -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  -- using packer.nvim
  -- misc{{{
  use {'wbthomason/packer.nvim'}
  use {
      'kyazdani42/nvim-tree.lua',
      config = function()
          require('telescope').setup{
              -- disables netrw completely
              disable_netrw       = true,
              -- hijack netrw window on startup
              hijack_netrw        = true,
              -- open the tree when running this setup function
              open_on_setup       = false,
              -- will not open on setup if the filetype is in this list
              ignore_ft_on_setup  = {},
              -- closes neovim automatically when the tree is the last **WINDOW** in the view
              auto_close          = false,
              -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
              open_on_tab         = false,
              -- hijacks new directory buffers when they are opened.
              update_to_buf_dir   = {
                  -- enable the feature
                  enable = true,
                  -- allow to open the tree if it was previously closed
                  auto_open = true,
              },
              -- hijack the cursor in the tree to put it at the start of the filename
              hijack_cursor       = false,
              -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
              update_cwd          = false,
              -- show lsp diagnostics in the signcolumn
              diagnostics = {
                  enable = false,
                  icons = {
                      hint = "",
                      info = "",
                      warning = "",
                      error = "",
                  }
              },
              -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
              update_focused_file = {
                  -- enables the feature
                  enable      = false,
                  -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
                  -- only relevant when `update_focused_file.enable` is true
                  update_cwd  = false,
                  -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
                  -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
                  ignore_list = {}
              },
              -- configuration options for the system open command (`s` in the tree by default)
              system_open = {
                  -- the command to run this, leaving nil should work in most cases
                  cmd  = nil,
                  -- the command arguments as a list
                  args = {}
              },

              view = {
                  -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
                  width = 30,
                  -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
                  height = 30,
                  -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
                  side = 'left',
                  -- if true the tree will resize itself after opening a file
                  auto_resize = false,
                  mappings = {
                      -- custom only false will merge the list with the default mappings
                      -- if true, it will only use your list to set the mappings
                      custom_only = false,
                      -- list of mappings to set on the tree manually
                      list = {}
                  }
              }
          }
      end
  }

  -- }}}
  -- telescope {{{
      use {
          'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
          config = function()
              require('telescope').setup{
                  defaults = {
                      vimgrep_arguments = {
                          'rg',
                          '--color=never',
                          '--no-heading',
                          '--with-filename',
                          '--line-number',
                          '--column',
                          '--smart-case'
                      },
                      prompt_prefix = "> ",
                      selection_caret = "> ",
                      entry_prefix = "  ",
                      initial_mode = "insert",
                      selection_strategy = "reset",
                      sorting_strategy = "descending",
                      layout_strategy = "horizontal",
                      layout_config = {
                          horizontal = {
                              mirror = false,
                          },
                          vertical = {
                              mirror = false,
                          },
                      },
                      file_sorter =  require'telescope.sorters'.get_fuzzy_file,
                      file_ignore_patterns = {},
                      generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
                      winblend = 0,
                      border = {},
                      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
                      color_devicons = true,
                      use_less = true,
                      path_display = {},
                      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
                      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
                      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
                      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

                      -- Developer configurations: Not meant for general override
                      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
                  }
              }


          end
      }

      -- }}}
  -- treesitter {{{
      use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

  -- }}}
  -- 状态栏插件{{{
  use {
     'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require'statusline' end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}

  }
  -- }}}
  --nvim-bufferline {{{
  use {
      'akinsho/nvim-bufferline.lua',
      -- requires = 'kyazdani42/nvim-web-devicons',
      config = function()
          require('bufferline').setup {
              options = {
                  -- numbers = "none" | "ordinal" | "buffer_id" | "both",
                  number = "both",
                  close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
                  right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                  left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
                  middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
                  -- NOTE: this plugin is designed with this icon in mind,
                  -- and so changing this is NOT recommended, this is intended
                  -- as an escape hatch for people who cannot bear it for whatever reason
                  indicator_icon = '▎',
                  buffer_close_icon = '',
                  modified_icon = '●',
                  close_icon = '',
                  left_trunc_marker = '',
                  right_trunc_marker = '',
                  --- name_formatter can be used to change the buffer's label in the bufferline.
                  --- Please note some names can/will break the
                  --- bufferline so use this at your discretion knowing that it has
                  --- some limitations that will *NOT* be fixed.
                  name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
                      -- remove extension from markdown files for example
                      if buf.name:match('%.md') then
                          return vim.fn.fnamemodify(buf.name, ':t:r')
                      end
                  end,
                  max_name_length = 18,
                  max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                  tab_size = 18,
                  -- diagnostics = false | "nvim_lsp",
                  diagnostics = false,
                  diagnostics_indicator = function(count, level, diagnostics_dict, context)
                      return "("..count..")"
                  end,
                  -- NOTE: this will be called a lot so don't do any heavy processing here
                  -- custom_filter = function(buf_number)
                  --     -- filter out filetypes you don't want to see
                  --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                  --         return true
                  --     end
                  --     -- filter out by buffer name
                  --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                  --         return true
                  --     end
                      -- filter out based on arbitrary rules
                      -- e.g. filter out vim wiki buffer from tabline in your work repo
                      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                      --     return true
                      -- end
                  -- end,
                  -- offsets = {{filetype = "NvimTree", text = "File Explorer" | function , text_align = "left" | "center" | "right"}},
                  offsets = {{filetype = "NvimTree", text = "文件浏览器"  , text_align = "center" }},
                  -- show_buffer_icons = true | false, -- disable filetype icons for buffers
                  show_buffer_icons = true,
                  -- show_buffer_close_icons = true | false,
                  show_buffer_close_icons = true,
                  -- show_close_icon = true | false,
                  show_close_icon = true, 
                  -- show_tab_indicators = true | false,
                  show_tab_indicators = true,
                  persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                  -- can also be a table containing 2 custom separators
                  -- [focused and unfocused]. eg: { '|', '|' }
                  -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
                  separator_style = "slant",
                  -- enforce_regular_tabs = false | true,
                  enforce_regular_tabs = false,
                  -- always_show_bufferline = true | false,
                  always_show_bufferline = true,
                  -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                  --     -- add custom logic
                  --     return buffer_a.modified > buffer_b.modified
                  -- end
                  sord_by = 'id'
              }
          }


      end

  }
  --}}}
  --- todo-comment 配置{{{
  use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
          require("todo-comments").setup {
              signs = true, -- show icons in the signs column
              sign_priority = 8, -- sign priority
              -- keywords recognized as todo comments
              keywords = {
                  FIX = {
                      icon = " ", -- icon used for the sign, and in search results
                      color = "error", -- can be a hex color, or a named color (see below)
                      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                      -- signs = false, -- configure signs for some keywords individually
                  },
                  TODO = { icon = " ", color = "info" },
                  HACK = { icon = " ", color = "warning" },
                  WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                  PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                  NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
              },
              merge_keywords = true, -- when true, custom keywords will be merged with the defaults
              -- highlighting of the line containing the todo comment
              -- * before: highlights before the keyword (typically comment characters)
              -- * keyword: highlights of the keyword
              -- * after: highlights after the keyword (todo text)
              highlight = {
                  before = "fg", -- "fg" or "bg" or empty
                  keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
                  after = "fg", -- "fg" or "bg" or empty
                  pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
                  comments_only = true, -- uses treesitter to match keywords in comments only
                  max_line_len = 400, -- ignore lines longer than this
                  exclude = {}, -- list of file types to exclude highlighting
              },
              -- list of named colors where we try to extract the guifg from the
              -- list of hilight groups or use the hex color if hl not found as a fallback
              colors = {
                  error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
                  warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
                  info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
                  hint = { "LspDiagnosticsDefaultHint", "#10B981" },
                  default = { "Identifier", "#7C3AED" },
              },
              search = {
                  command = "rg",
                  args = {
                      "--color=never",
                      "--no-heading",
                      "--with-filename",
                      "--line-number",
                      "--column",
                  },
                  -- regex that will be used to match keywords.
                  -- don't replace the (KEYWORDS) placeholder
                  pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                  -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
              },
          }
      end
  }
  --}}}
end)

---}}}

