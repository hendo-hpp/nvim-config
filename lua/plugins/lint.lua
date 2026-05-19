-- nvim-lint.lua
-- supported languages to lint on file write/exit
-- https://github.com/mfussenegger/nvim-lint

require('lint').linters_by_ft = {
    --asm        = {''}
    sh         = {'shellcheck'},
    c          = {'clangtidy'},
    cmake      = {'cmakelint'},
    cpp        = {'clangtidy'},
    cuda       = {'clangtidy'},
    glsl       = {'glslc'},
    haskell    = {'hlint'},
    java       = {'checkstyle'},
    --javascript = {''}
    json       = {'jsonlint'},
    lua        = {'luacheck'},
    make       = {'checkmake'},
    markdown   = {'vale'},
    python     = {'ruff'},
    rust       = {'clippy'},
    --typescript = {''}
}
