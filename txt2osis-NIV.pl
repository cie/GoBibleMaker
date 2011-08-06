print '<?xml version="1.0" encoding="UTF-8" ?>
<osis xmlns="http://www.bibletechnologies.net/2003/OSIS/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.bibletechnologies.net/2003/OSIS/namespace osisCore.2.5.xsd">
';

$name = <>;
$name =~ s/\n$//;
$title = <>;
$title =~ s/\n$//;

print "<osisText osisIDWork=\"$name\" osisRefWork=\"defaultReferenceScheme\" xml:lang=\"en\">
	<header>
		<work osisWork=\"$name\">
			<title>$title</title>
			<identifier type=\"OSIS\">Bible.$name</identifier>
		</work>
	</header>

";
$testament = 0;
$chapter = 0;
$book = 0;
$verse = 0;
@books = ();
@booknames = ();

while (<>) {
	if (/^#C/) {
                # start chapter
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		$chapter++;
		$verse = 0;
		print "<chapter osisID=\"$bid.$chapter\">\n";
        } elsif (/^#B/) {
                # Start book
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
                $bname = <>; chomp $bname;
                $bid = <>; chomp $bid;
                push(@booknames, $bname);
                push(@books, $bid);
                $book = 1;
		$chapter = 0;
		$verse = 0;
                print "<div type=\"book\" osisID=\"$bid\">\n";
        } elsif (/^((\S{2,}\.)|(Job|Jude)) (\d+:)?(\d+)\s+(.*)$/) {
                # print verse line
                if ($4) { die "Wrong chapter num: $_" if $4 !~ /$chapter:/ }
                else { die "Wrong 1-chapter book: $_" if $2 !~ /Ob./ and $2 !~ /Phile./ and $2 !~ /(2|3)Jn./ and $3 !~ /Jude/ }

                if ($verse) {print "</verse>\n"; }
                if ($5 != 0) { 
                    print "<verse>";
                    $verse = $5;
                    print $6;
                }
	} elsif (/^#T/) {
                # start New Testament
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
		if ($testament) { print "</div>\n"; }
		print "<div type=\"x-testament\">\n";
		$book=0; $chapter=0; $verse=0; $testament=1;
	} elsif (/^\s*$/) {
	} elsif (/^\d+\s*$/) {
        } else {
                chomp;
                print " $_";
	}
}

if ($verse) { print "</verse>\n"; }
if ($chapter) { print "</chapter>\n"; }
if ($book) { print "</div>\n"; }
if ($testament) { print "</div>\n"; }
print "</osisText>
</osis>
";

for($i=0; $i<@booknames; $i++) {
	print STDERR "Book: ", $books[$i], "\n";
}
for($i=0; $i<@booknames; $i++) {
	print STDERR "Book-Name-Map: ", $books[$i], ", ", $booknames[$i], "\n";
}

