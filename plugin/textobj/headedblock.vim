if exists('g:loaded_textobj_headed_block')
    finish
endif

if exists(':NeoBundleDepends') == 2
    NeoBundleDepends 'kana/vim-textobj-user'
endif

if !exists('g:a_headed_block_map')
    let g:a_headed_block_map = 'ak'
endif

if !exists('g:inner_headed_block_map')
    let g:inner_headed_block_map = 'ik'
endif

call textobj#user#plugin('headedblock', {
    \   '-': {
    \     'select-a-function': 'textobj#headedblock#select_a',
    \     'select-a': g:a_headed_block_map,
    \     'select-i-function': 'textobj#headedblock#select_i',
    \     'select-i': g:inner_headed_block_map,
    \   },
    \ })

let g:loaded_textobj_headed_block = 1
