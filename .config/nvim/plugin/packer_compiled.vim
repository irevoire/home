" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/irevoire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/irevoire/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/irevoire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/irevoire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/irevoire/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["restore_view.vim"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/restore_view.vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-multiple-cursors"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-multiple-cursors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/irevoire/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
