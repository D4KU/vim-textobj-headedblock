if exists('g:loaded_textobj_headed_block')
    finish
endif

if exists(':NeoBundleDepends') == 2
    NeoBundleDepends 'kana/vim-textobj-user'
endif

if !exists('g:a_headed_block_key')
    let g:a_headed_block_key = 'ak'
endif

if !exists('g:inner_headed_block_key')
    let g:inner_headed_block_key = 'ik'
endif

call textobj#user#plugin('headedblock', {
    \   '-': {
    \     'select-a-function': 'textobj#headedblock#select_a',
    \     'select-a': g:a_headed_block_key,
    \     'select-i-function': 'textobj#headedblock#select_i',
    \     'select-i': g:inner_headed_block_key,
    \   },
    \ })

let g:loaded_textobj_headed_block = 1
