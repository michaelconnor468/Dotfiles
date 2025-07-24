local ok, telescope = pcall(require, 'telescope')
if not ok then
  print('Unable to procure telescope')
  return
end

local actions = require 'telescope.actions'

telescope.setup {
    defaults = {
        prompt_prefix = ' > ',
        color_devicons = true,
        layout_strategy = 'vertical',
        layout_config = {
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = 'bottom',
                width = 0.8
            }
        },

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,
                ['<C-d>'] = actions.move_selection_next,
                ['<C-u>'] = actions.move_selection_previous,

                ['<C-;>'] = actions.close,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,

                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<C-k>'] = actions.preview_scrolling_up,
                ['<C-j>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-l>'] = actions.complete_tag,
                ['<C-h>'] = actions.which_key
            },

            n = {
                ['<esc>'] = actions.close,
                [';'] = actions.close,
                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,
                ['<C-d>'] = actions.delete_buffer,
                
                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['<C-k>'] = actions.preview_scrolling_up,
                ['<C-j>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<C-h>'] = actions.which_key
            },
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    },
}

telescope.load_extension('fzy_native')
