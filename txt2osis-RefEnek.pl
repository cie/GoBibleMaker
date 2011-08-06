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
@books = ();
@booknames = ();

while (<>) {
	if (/^#C/) {
                # start chapter
		if ($chapter) { print "</chapter>\n"; }
		$chapter++;
		print "<chapter osisID=\"$bid.$chapter\">\n";
        } elsif (/^#B/) {
                # Start book
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
                $bname = <>; chomp $bname;
                $bid = <>; chomp $bid;
                push(@booknames, $bname);
                push(@books, $bid);
                $book = 1;
		$chapter = 0;
                print "<div type=\"book\" osisID=\"$bid\">\n";
	} elsif (/^#T/) {
                # start New Testament
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
		if ($testament) { print "</div>\n"; }
		print "<div type=\"x-testament\">\n";
		$book=0; $chapter=0; $testament=1;
        } else {
                print "<verse>$_</verse>";
	}
}

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

