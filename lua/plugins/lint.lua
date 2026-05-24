-- nvim-lint.lua
-- supported languages to lint
-- https://github.com/mfussenegger/nvim-lint

require('lint').linters_by_ft = {
    sh         = {'shellcheck'},
    cmake      = {'cmakelint'},
    haskell    = {'hlint'},
    make       = {'checkmake'},
}
