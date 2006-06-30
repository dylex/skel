#!/usr/bin/perl

$HOME=$ENV{'HOME'};
$PIXDIR="$HOME/pix/cd";

sub add($$)
{
	my ($title, $act) = @_;
	$title =~ s/&/&&/g;
	print "AddToMenu CDMenu \"";
	my $pix = "$PIXDIR/$act.xpm";
	$pix =~ s/ //g;
	if (-f $pix)
	{
		print "\%$pix%";
	}
	print "$title\" Exec exec cdcd $act\n";
}

open(TRACKS, "cdcd tracks |") or die "Can't get track list: $!\n";
while (<TRACKS>) {
	chomp;
	if (($t) = /^Album name:\s*(.*)$/)
	{
		add $t, "play";
	}
	elsif (($t) = /^Album artist:\s*(.*)$/)
	{
		add $t, "stop";
	}

	elsif (($tr, $ti) = /^Total tracks:\s*(\d*)\s*Disc length:\s*(\d+:\d\d)\s*$/)
	{
		add "[$ti] $tr tracks", "eject";
	}
	elsif (($n, $time, $title) = /^\s*(\d+):\s*>?\s*\[(\s*\d+:\d\d).\d\d\]\s*(.*?)\s*$/)
	{
		$time =~ tr/ /0/;
		add "[$time] $title", "play $n";
	}
}
close TRACKS;
exit 0;
