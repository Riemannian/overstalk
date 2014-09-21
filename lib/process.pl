sub process_main {
	$log = $_[0];
	open(FILE, "<$log");
	@file = <FILE>;
	close(FILE);
	@nicks;
	foreach $linea (@file) { 
		if ($linea =~ m/\: (.*?)#/g) {
			push(@nicks, $1);
		}	
	}
	foreach $nick (@nicks) { &nick_main($nick); }
}





































1;
