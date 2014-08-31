
fun SwitchExt(cmd, ext)
  execute a:cmd fnameescape(fnamemodify(bufname("%"), ":r") . a:ext)
endfun

