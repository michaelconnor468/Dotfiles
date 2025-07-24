local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  print("failed to load nvim-tree")
  return
end

nvim_tree.setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 50,
    side = "left",
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})
