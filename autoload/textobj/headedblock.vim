function! s:main(inner)
    " move into body if cursor on closing brace
    if getline('.') =~# '}'
        normal! k
    endif

    normal! ]}
    let l:end = getpos('.')
    normal! %

    " which one is closest above the cursor?
    " a) '{'
    " b) '}'
    " c) empty line
    let l:a = search('{', 'bnW')
    let l:b = search('}', 'bnW')

    " (c)
    normal! {
    let l:start = getpos('.')
    let l:nonstd = 0

    " set start to nearest of (a), (b), (c)
    for l:i in [l:a, l:b]
        if l:i > l:start[1]
            let l:start[1] = l:i
            let l:nonstd = 1
        endif
    endfor

    " if there is no empty line above or this is the 'inner' text object,
    " don't include the line before the headed block
    if (l:nonstd || a:inner)
        let l:start[1] += 1
    endif

    " if there is no empty line above, this is the 'a' text object, and the
    " line after the end is empty, include that line
    if (l:nonstd && !a:inner && getline(l:end[1] + 1) =~ '^\s*$')
        let l:end[1] += 1
    endif

    return ['V', l:start, l:end]
endfunction

function! textobj#headedblock#select_i()
    return s:main(1)
endfunction

function! textobj#headedblock#select_a()
    return s:main(0)
endfunction
