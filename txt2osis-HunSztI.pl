print '<?xml version="1.0" encoding="UTF-8" ?>
<osis xmlns="http://www.bibletechnologies.net/2003/OSIS/namespace" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.bibletechnologies.net/2003/OSIS/namespace osisCore.2.5.xsd">
';

$name=<>;
$name =~ s/...([a-zA-Z]+)\n/\1/;
$title = <>;
$title =~ s/\n$//;

print "<osisText osisIDWork=\"$name\" osisRefWork=\"defaultReferenceScheme\" xml:lang=\"hu\">
	<header>
		<work osisWork=\"$name\">
			<title>$title</title>
			<identifier type=\"OSIS\">Bible.$name</identifier>
		</work>
	</header>

	<div type=\"x-testament\">
";
$chapter = 0;
$book = 0;
$verse = 0;
@books = ();
@booknames = ();

while (<>) {
	if(/^(\S{2,}) (\d+)\s*$/) {
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		$chapter = 1;
		$verse = 0;
		if ($2 == 1) {
			print "<div type=\"book\" osisID=\"$1\">\n";
			push(@books, $1);
		}
		print "<chapter osisID=\"$1.$2\">\n";
	} elsif (/^(\S{2,}) (\d+)\.(\d+)([a-z]*)\s*$/) {
		if ($verse+1 == $3) {
			if ($verse) {print "</verse>\n"; }
			print "<verse>";
		} elsif ($verse != $3) {
                    die("Hiba: $_");
                }
		$verse = $3;
		$l=<>;
		$l =~ s/\n$//;
		print $l;
		<>;
	} elsif (/^={5,80}/) {
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
		print "</div>\n";
		print "<div type=\"x-testament\">\n";
		$book=0; $chapter=0; $verse=0;
	} elsif (/^\s*$/) {
	} else {
		if ($verse) { print "</verse>\n"; }
		if ($chapter) { print "</chapter>\n"; }
		if ($book) { print "</div>\n"; }
		if (!/^\s*$/) {
			push(@booknames, $_);
		}
		$book = 1;
		$chapter = 0;
		$verse = 0;
	}
}

if ($verse) { print "</verse>\n"; }
if ($chapter) { print "</chapter>\n"; }
if ($book) { print "</div>\n"; }
print "</div>
</osisText>
</osis>
";

for($i=0; $i<@booknames; $i++) {
	print STDERR "Book: ", $books[$i], "\n";
}
for($i=0; $i<@booknames; $i++) {
	print STDERR "Book-Name-Map: ", $books[$i], ", ", $booknames[$i];
}

