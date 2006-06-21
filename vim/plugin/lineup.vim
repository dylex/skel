
fun LineUpAt(col)
        while virtcol('.') > a:col
                if getline('.')[col('.')-2] !~ '\s'
                        return
                endif
                normal! hx
        endwhile
        while a:col - virtcol('.') > 8
                normal! i       
                normal! l
        endwhile
        while a:col > virtcol('.')
                normal! i 
                normal! l
        endwhile
endfun

fun LineUpPrevWord()
        let c = virtcol('.')
        normal! jb
        call LineUpAt(c)
endfun

fun LineUpNextWord()
        let c = virtcol('.')
        normal! jw
        call LineUpAt(c)
endfun

