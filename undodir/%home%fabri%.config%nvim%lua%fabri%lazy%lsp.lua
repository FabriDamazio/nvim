Vim�UnDo� .�q�8HR_85=f�e�5�H�7v�u��($   w                                   ga�    _�                     1        ����                                                                                                                                                                                                                                                                                                                            1           ?           V        ga�     �   0   1                  zls = function()   0          local lspconfig = require("lspconfig")             lspconfig.zls.setup({   T            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),               settings = {                 zls = {   *                enable_inlay_hints = true,   '                enable_snippets = true,   "                warn_style = true,                 },               },             })   (          vim.g.zig_fmt_parse_errors = 0   $          vim.g.zig_fmt_autosave = 0           end,5��    0                      '      �              5�_�                     1        ����                                                                                                                                                                                                                                                                                                                            1           1           V        ga�    �   0   1           5��    0                      '                     5��