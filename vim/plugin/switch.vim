
fun SwitchExt(cmd, ext, ...)
  let b = fnamemodify(bufname("%"), ":r")
  for ext in a:000
    if filereadable(b . ext)
      execute a:cmd fnameescape(b . ext)
      return
    endif
  endfor
  execute a:cmd fnameescape(b . a:ext)
endfun

