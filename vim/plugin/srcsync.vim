fun SourcesSetup ()
	let d = getcwd()
	let c = resolve($HOME . '/cvs/')
	if strpart(d, 0, strlen(c)) != c
		let $SRCDIR = ''
		return
	endif
	let d = strpart(d, strlen(c))
	let i = stridx(d, '/')
	if i != -1
		let d = strpart(d, 0, i)
	endif
	let $SRCDIR = c . d
endfun
fun SyncSources ()
	update
	if !exists($SRCDIR)
		call SourcesSetup()
	endif
	if $SRCDIR != ''
		!$SRCDIR/sync
	endif
endfun
fun SourceTagSetup ()
	if !exists($SRCDIR)
		call SourcesSetup()
	endif
	set tags+=$SRCDIR/tags
endfun
"call SourceTagSetup()
