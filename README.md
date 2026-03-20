# After-Dark
After Dark neovim colorscheme based on the after-dark VSCode colorscheme :)

## Installation
```lua
return {
  "Kopihue/after-dark",
  config = function()
    require("after-dark").setup({})
  end
}
```
___
## Gallery
<img width="1859" height="986" alt="image" src="https://github.com/user-attachments/assets/db38e3e2-7dfc-4157-8048-904032d25cdd" />
<img width="1902" height="1036" alt="image" src="https://github.com/user-attachments/assets/0cc1d9ea-9b78-466f-ae3e-400ab24394e2" />

___
## Configuration
```lua
require("after-dark").setup({
  transparency = false,
  bold = true,
  italic = true,
})
```

___
# Note about lsp
Lsp will highlight the words in the buffer if you don't deactivate that feature, to deativate it put this in you init.lua
```lua
-- disable lsp syntax highlighting
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
	      local client = vim.lsp.get_client_by_id(args.data.client_id)
	      if client then
	        client.server_capabilities.semanticTokensProvider = nil
	      end
    end,
})
```

___
# Enjoy! ❤️💚💙
