changecom`'dnl
# generated CLIENTHOST for SERVERHOST (USER@HOSTNAME) OSTYPE (HOME) on SCREEN at WIDTH`'x`'HEIGHT
define(`ADDTO', `define(`$1', eval($1+$2))')dnl
define(`_FORLIST', `ifelse($#, 0,, $#, 1, `_FORITER($1)', `_FORITER($1)`'_FORLIST(shift($@))')')dnl
define(`FORLIST', `pushdef(`_FORITER', `$1')_FORLIST(shift($@))`'popdef(`_FORITER')')dnl
define(`SEQLIST', `ifelse($1, $2, $1, `$1, SEQLIST(incr($1), $2)')')dnl
define(`IFEXEC', `syscmd(which -s $1 >/dev/null 2>&1)ifelse(sysval, 0, shift($@))')dnl
dnl
define(ifelse(HOSTNAME, `datura.dylex.net', `HOMEHOST',
	HOSTNAME, `druid.pasadena.rainfinity.com', `WORKHOST',
	`OTHERHOST'))dnl
define(`SCREENS', ifdef(`WORKHOST', 2, 1))dnl
define(`DESKTOPS', ifdef(`WORKHOST', 10, 8))dnl
define(`TOPHEIGHT', 50)dnl
define(`BUTTONS', ifdef(`HOMEHOST', 4, 3))dnl
dnl
dnl
ifelse(SCREENS, 1, `dnl',
	Xinerama on)

DeskTopSize DESKTOPS 1

ClickTime 200
EdgeThickness 1
EdgeScroll 0 0
EdgeResistance 0 0
SnapAttraction 2 Screen
#Emulate Mwm

DestroyFunc GotoHome
AddToFunc GotoHome
+	I GotoDeskAndPage 0 ifelse(SCREEN, 0, 0, eval(DESKTOPS-1)) 0

define(`TOPDIR', ifelse(SCREEN, 0, +, -))dnl
define(`TOPSTARTX', 0)dnl
define(`TOPPUSHX', `TOPDIR`'TOPSTARTX`'ADDTO(`TOPSTARTX', $1)')dnl
define(`TOPGEOM', `$1x`'eval(TOPHEIGHT-$2)TOPPUSHX($1)`'+$3')dnl

*FvwmPager: Geometry TOPGEOM(eval(DESKTOPS*((TOPHEIGHT-2)*WIDTH/HEIGHT)), 2, 0)
dnl
define(STARTLIST, `
	`"backer",	Module FvwmBacker',
	`"pager",	Module FvwmPager *',
	`"commandS",	Module FvwmCommandS',
	`"event",	Module FvwmEvent',
	`"home",	GotoHome',
	`"eyes",	Exec nice xeyes -geometry ''TOPGEOM(eval(TOPHEIGHT-2), 2, 1)``','
	ifdef(`HOMEHOST', ``
		`"stripchart",	Exec nice -8 stripchart --geometry ''TOPGEOM(360, 0, 0)``',
		`"xrw",		Exec nice -5 xrtail -geom 80x7''ADDTO(`TOPSTARTX', 2)TOPPUSHX(80*5)``+0 -fn 5x8 -fg "#FFFFBB" HOME/.xrw','',
		`ifelse(SCREENS.SCREEN, `2.0',, ``
			`"xload",	Exec nice -8 xload -bg "#3050A0" -fg "#F0E000" -nolabel -update 30 -geometry ''TOPGEOM(120, 0, 0)``','')')
	ifelse(SCREENS.SCREEN, `2.1',, `IFEXEC(xdaliclock, ``
		`"clock",	Exec nice -5 xdaliclock -geometry ''ADDTO(`TOPSTARTX', -50)TOPGEOM(200, 0, 0)`` -transparent -hex -noseconds -fg "#FFFFCC" -fn "-*-luxi sans-medium-r-*-*-*-400-*-*-*-*-iso8859-1"','')')`
	`"stuck term",	Exec xterm -title "stuck term" -fn 6x10 -fb 6x10 -geometry 80x24-0+TOPHEIGHT','
	ifelse(SCREEN, 0, `
		ifdef(`HOMEHOST',, ``
			`"screensaver",	Exec xscreensaver','')
		IFEXEC(xbg, ``
		`"xbg",		Exec xbg','')')`
	`"xset",	Exec xset b 100 3520 ''ifdef(HOMEHOST, 20, 35)`` m 3 5 +dpms dpms 1200 0 2400 r rate 250 30'')dnl
dnl
*FvwmWinList: Geometry TOPGEOM(500, 0, 0)

DestroyFunc StartFunction
AddToFunc StartFunction
	FORLIST(`+ I $2
	', STARTLIST)dnl

DestroyFunc ExitFunction
AddToFunc ExitFunction

DestroyMenu StartupMenu
AddToMenu StartupMenu
	FORLIST(`+ $1	$2
	', STARTLIST)dnl

Colorset 0 bg #000000, fg #ffffff
Colorset 1 RootTransparent, fg #000000

Style * Title
Style * ForeColor #000000, HilightFore #000000
Style * BackColor #8080AA, HilightBack #BBBBA4
Style * Font -b&h-lucida-medium-r-*-*-10-*-*-*-*-*-iso8859-1
Style * IconFont -b&h-lucida-medium-r-*-*-11-*-*-*-*-*-iso8859-1
Style * MwmBorder, BorderWidth 1, HandleWidth 3
Style * DecorateTransient
Style * MouseFocus, GrabFocus
Style * MinOverlapPlacement
Style * Slippery, StickyIcon, CirculateSkipIcon
Style * IconBox 512x48`'ifelse(SCREEN, 0, -, +)1+0, IconGrid 48 48, IconFill ifelse(SCREEN, 0, r, l) b
Style * WindowShadeScrolls, WindowShadeSteps 0
Style * BackingStoreOff
OpaqueMoveSize 0

Style "FvwmPager"	BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, NeverFocus, GrabFocusOff, Layer 3
Style "FvwmWinList"	BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff
Style "panel"		BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, Layer 3
Style "xeyes"		BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff, Layer 2
Style "stripchart"	BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff, Layer 2
Style "xload"		BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff, Layer 2
Style "xdaliclock"	BorderWidth 0, HandleWidth 0, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff, Layer 2
Style "xbiff"		BorderWidth 0, HandleWidth 0, NoTitle, Sticky, WindowListSkip, CirculateSkip, ClickToFocus, GrabFocusOff, Layer 2
Style "gomp"		BorderWidth 0, NoHandles, NoTitle, Sticky, WindowListSkip, GrabFocusOff, Layer 3
Style "stuck term"	Sticky
#Style "xlogmaster"	StartsOnPage 7 0, SkipMapping, GrabFocusOff
Style "qiv"		GrabFocusOff, CascadePlacement
Style "feh"		GrabFocusOff, CascadePlacement
Style "nethack"		GrabFocusOff

ButtonState ActiveDown False
TitleStyle LeftJustified
TitleStyle ActiveUp HGradient 16 #BBBBA4 #999999 -- flat
TitleStyle Inactive HGradient 16 #8080AA #808080 -- flat
BorderStyle -- NoInset Raised
ButtonStyle Left MiniIcon -- flat

MenuStyle * BorderWidth 1
MenuStyle * Foreground #000000, Background #B0B0B0
MenuStyle * HilightBack, Hilight3DOff
MenuStyle * Font -adobe-helvetica-medium-r-*-*-12-*-*-*-p-*-iso8859-1
MenuStyle * PopupDelay 0, PopdownImmediately, RemoveSubmenus
MenuStyle * PopupOffset 0 100
MenuStyle * SeparatorsLong, TrianglesSolid

DestroyFunc MyIconify
AddToFunc MyIconify
+	I Iconify $0
+	I All (Iconic) RecaptureWindow

DestroyFunc GotoScreen
AddToFunc GotoScreen
+	I WindowId root $0 WarpToWindow 50 50

*FvwmPager: LabelsBelow
*FvwmPager: Font none
*FvwmPager: SmallFont 5x8
*FvwmPager: Colorset * 1
#*FvwmPager: Fore #000000
#*FvwmPager: Back #3050A0
*FvwmPager: HilightColorset * 1
#*FvwmPager: Hilight #407099
*FvwmPager: MiniIcons
*FvwmPager: Balloons pager

*FvwmEvent: Cmd
*FvwmEvent: PassID

*FvwmIdent: Back #5090B0
*FvwmIdent: Fore #FFFF00
*FvwmIdent: Font -adobe-helvetica-medium-r-*-*-12-*-*-*-*-*-*-*

DestroyFunc WindowListFunc
AddToFunc WindowListFunc
+	I WindowId $0 MyIconify off
+	I WindowId $0 FlipFocus
+	I WindowId $0 Raise
+	I WindowId $0 WarpToWindow 50 50

#*FvwmWinList: Back #180850
*FvwmWinList: Colorset 1
*FvwmWinList: Fore #000000
*FvwmWinList: FocusColorset 1
*FvwmWinList: FocusFore #FFFFFF
*FvwmWinList: Font -b&h-lucida-medium-r-*-*-10-*-*-*-*-*-iso8859-1
*FvwmWinList: Action Click1 Focus
*FvwmWinList: Action Click4 FvwmIdent
*FvwmWinList: Action Click3 MyIconify
*FvwmWinList: Action Click2 Menu WindowMenu
*FvwmWinList: UseSkipList
*FvwmWinList: UseIconNames
*FvwmWinList: LeftJustify

DestroyFunc MoveGoToPage
AddToFunc MoveGoToPage
+	I MoveToPage $*
+	I GotoPage $*

### Window menus

DestroyMenu WindowToPage
AddToMenu WindowToPage
	FORLIST(`+ "incr($1)" MoveToPage $1 0p
	', SEQLIST(0, decr(DESKTOPS)))dnl

DestroyFunc Bigify
AddToFunc Bigify
+	I ResizeMove eval(WIDTH-6)p eval(HEIGHT-TOPHEIGHT-6)p 0p eval(TOPHEIGHT)p

DestroyMenu WindowMenu
AddToMenu WindowMenu
+	"ident"		FvwmIdent
+	""		Nop
+	"move"		Move
+	"next"		MoveToPage +1p 0p
+	"prev"		MoveToPage -1p 0p
+	"page"		Popup WindowToPage
+	""		Nop
+	"raise"		Raise
+	"lower"		Lower
+	"above"		Layer +1
+	"below"		Layer -1
+	""		Nop
+	"resize"	Resize
+	"big"		Bigify
+	"fill"		Maximize grow grow
+	""		Nop
+	"icon"		MyIconify
+	"stick"		Stick
+	"shade"		WindowShade
+	""		Nop
+	"refresh"	RefreshWindow
+	"delete"	Delete
+	"destroy"	Destroy

### Main menus
define(`IFEXECMENU', `IFEXEC($1, `+	"$1"	Exec $1 $2', `dnl')')

DestroyFunc MakeCDMenu
AddToFunc MakeCDMenu
+	I DestroyMenu CDMenu
+	I AddToMenu CDMenu "%HOME/media/pix/cd/loop.xpm%refresh" Function MakeCDMenu
+	I PipeRead "HOME/.fvwm/cdmenu.pl"
DestroyMenu CDMenu
AddToMenu CDMenu "%HOME/media/pix/cd/loop.xpm%refresh" Function MakeCDMenu

DestroyFunc LoginTo
AddToFunc LoginTo
+	I Exec xterm -title $0 -e ssh $0

DestroyMenu LoginMenu
AddToMenu LoginMenu
+       "Login"         FvwmForm FvwmForm-Login
FORLIST(`+	"$1"	LoginTo "$1"
', localhost`'esyscmd(awk 'BEGIN { ORS="" } /^Host ([a-z0-9_-]*)$/ { print "`,'"$2 }' HOME/.ssh/config))dnl
ifdef(`WORKHOST',
+       "gotracker"   	Exec exec rdesktop -u qaguest -p rain -d rainbay -K -g 1274x948 128.222.168.207
+	"xombie"	Exec exec rdesktop -g 1274x948 -r sound:local -a 24 xombie
)dnl

DestroyFunc OpenBrowser
AddToFunc OpenBrowser
+	I Exec firefox $0

DestroyMenu AppsMenu
AddToMenu AppsMenu	"Applications" Title
IFEXECMENU(jpilot)
IFEXECMENU(gnumeric)
IFEXECMENU(gimp)
IFEXECMENU(xfig)
IFEXECMENU(xv)
+	""		Nop
+	"editres"	Exec editres
+	"xmag"		Exec xmag
+	"xcutsel"	Exec xcutsel
+	"xfontsel"	Exec xfontsel

DestroyMenu MainMenu
AddToMenu MainMenu
+	"xterm"		Exec xterm
+	"xterm-login"	Exec xterm +ut
+	"rxvt"		Exec rxvt
+	"srxvt"		Exec rxvt -fn 6x10 -fb 6x10 -geometry 166x69
+	""		Nop
+	"firefox"	OpenBrowser
IFEXEC(w4m, `+	"w3m"		Exec rxvt -e w3m -v', `dnl')
IFEXECMENU(nethack, --geometry=553x128)
IFEXECMENU(zsnes)
+	"Login"		Popup LoginMenu
+	"Apps"		Popup AppsMenu

DestroyMenu ModulesMenu
AddToMenu ModulesMenu
+	"Buttons"	Module FvwmButtons
+	"CommandS"	Module FvwmCommandS
+	"Debug"		Module FvwmDebug
+	"Event"		Module FvwmEvent
+	"Form form"	Module FvwmForm FvwmForm-Form
+	"IconBox"	Module FvwmIconBox
+	"IconMan"	Module FvwmIconMan
+	"Pager"		Module FvwmPager
+	"Save"		Module FvwmSaveDesk
+	"Scroll"	Module FvwmScroll
+	"TaskBar"	Module FvwmTaskBar
+	"WinList"	Module FvwmWinList
+	"Wharf"		Module FvwmWharf

DestroyMenu ConfMenu
AddToMenu ConfMenu
+	"CD"		Popup CDMenu
+	""		Nop
+	"screensaver"	Exec xscreensaver-command -activate
+	"Screensaver"	Exec xscreensaver-command -prefs
+	""		Nop
+	"Startup"	Popup StartupMenu
+	"Modules"	Popup ModulesMenu
+	"console"	Module FvwmConsole
+	"ident"		Module FvwmIdent
+	""		Nop
+	"run"		FvwmForm FvwmForm-Run
+	"kill"		Exec xkill
+	"refresh"	Exec xrefresh
+	"restart"	Restart
+	"exit"		Quit

Mouse 1	R   	N       Menu MainMenu
Mouse 2	R	N	WindowList
Mouse 3	R    	N	Menu ConfMenu
ifelse(BUTTONS, 4, `Mouse 4	R    	N       Menu AppsMenu', `dnl')

DestroyFunc RaiseResize
AddToFunc RaiseResize
+	C Raise
+	M Resize
DestroyFunc ReaiseMoveShade
AddToFunc RaiseMoveShade
+	C Raise
+	M Move
+	D WindowShade
DestroyFunc UniconifyMove
AddToFunc UniconifyMove
+	C MyIconify False
+	M Move

DestroyFunc FocusRaise
AddToFunc FocusRaise
+	I Focus
+	I Raise

DestroyFunc WarpFocus
AddToFunc WarpFocus
+	I FlipFocus
+	I Raise
+	I WarpToWindow 50 50

Mouse 1	1	N	MyIconify True
Mouse 2	1	N	Delete
Mouse 3	1	N	Stick True
ifelse(BUTTONS, 4, `Mouse 4	1	N	WindowShade True', `dnl')
Mouse 1	2	N	MoveGoToPage -1p 0p
Mouse 2	2	N	Bigify
Mouse 3	2	N	MoveGoToPage +1p 0p
ifelse(BUTTONS, 4, `Mouse 4	2	N	Maximize grow grow', `dnl')

Mouse 1 I	N	UniconifyMove
Mouse 1 T	N	RaiseMoveShade
Mouse 1 FS	N	RaiseResize
Mouse 2 TFSI	N	Menu WindowMenu
Mouse 3 TFSI	N	Lower
ifelse(BUTTONS, 4, `Mouse 4 T	N	Stick', `dnl')

Mouse 1 TFSW	4	Move
Mouse 2 TFSWI	4	Menu WindowMenu
Mouse 3 TFSW	4	Resize
ifelse(BUTTONS, 4, `Mouse 4 A	4	Module FvwmIdent', `dnl')

FORLIST(`Key F`'incr($1) A	N	GotoPage $1 0p
', SEQLIST(0, decr(DESKTOPS)))dnl

Key n A		4	Prev (CurrentPage) Focus
Key s A		4	Next (CurrentPage) Focus
Key d A 	4	ifelse(SCREENS, 1, `Next (CurrentPage) WarpFocus', `GotoScreen ifelse(SCREEN, 0, 1, 0)')
Key r A		4	Prev (CurrentPage) FocusRaise
Key c A		4	Next (CurrentPage) FocusRaise
Key w A		4	Raise
Key v A		4	Lower

Key h A		4	GotoPage -1p 0p
Key l A		4	GotoPage +1p 0p
Key j A		4	GotoDesk +1
Key k A		4	GotoDesk -1p
Key minus A	4	GotoPage prev
Key z A		4	MyIconify
Key Return A	4	GotoHome
Key space W	4	RefreshWindow

Key Left A	4	Direction West FlipFocus
Key Up A	4	Direction North FlipFocus
Key Down A	4	Direction South FlipFocus
Key Right A	4	Direction East FlipFocus

Key b A		4	Exec xbg && [ -p HOME/.xtail ] && touch HOME/.xtail
Key semicolon A 4	ifdef(`HOMEHOST', `Exec sleep 2 && xset dpms force off', `Exec xscreensaver-command -lock')
Key apostrophe A 4	ifdef(`HOMEHOST', `Exec sleep 2 && xset s activate', `Exec xscreensaver-command -activate')
Key q A 	4	Exec xscreensaver-command -lock
Key XF86Standby	A N	Exec exec xscreensaver-command -lock
Key t A		4	Exec rxvt
IFEXEC(jpilot, `Key p A		4	Exec jpilot', `dnl')
Key f A		4	OpenBrowser
Key d A		4S	LoginTo "dylex"

define(MIXERSET, `Exec ifelse(OSTYPE, Linux, `amixer -q ifdef(`HOMEHOST', -c1) set Master $1$2', OSTYPE, FreeBSD, `/usr/sbin/mixer ogain $2$1 > /dev/null')')dnl
Key KP_Add A	4S	MIXERSET(1,-)
Key KP_Subtract A 4S	MIXERSET(1,+)
Key KP_Enter A	4	Exec MIXERSET(8)
Key KP_Enter A	4S	Exec MIXERSET(48)
Key XF86AudioLowerVolume A N MIXERSET(1,-)
Key XF86AudioRaiseVolume A N MIXERSET(1,+)
Key XF86AudioMute A N 	Exec MIXERSET(8)
Key XF86AudioMute A S 	Exec MIXERSET(48)
ifelse(BUTTONS, 3, `dnl
Mouse 5 R 	N 	MIXERSET(-1)
Mouse 4 R 	N	MIXERSET(+1)', `dnl')

ifdef(`HOMEHOST', `dnl
Key KP_Divide A 4S	Exec mpc -p
Key KP_Multiply A 4S	Exec mpc -r
Key KP_Up A 	4S	Exec mpcpush -p
Key KP_Left A 	4S	Exec mpc -s -1
Key KP_Right A 	4S	Exec mpc -s +1
Key KP_End A 	4S	Exec mpc -s -0:30
Key KP_Down A 	4S	Exec mpcpop -s -0:15
Key KP_Next A 	4S	Exec mpc -s +0:30
', `dnl
Key XF86WWW A N         Exec gomp --display=:0.1 --geometry=180x0+0+0 http://dylex.net:2401/music/play-q5.ogg
Key XF86WWW A S         Exec gomp --display=:0.1 --geometry=180x0+0+0 http://dylex.net:2401/music/play-q2.ogg
')dnl

#Key backslash A 4	Exec xmodmap HOME/.modmap.qwerty
#Key grave A	4	Exec xmodmap HOME/.Xmodmap
