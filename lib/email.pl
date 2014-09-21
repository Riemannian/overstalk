sub email_main {
	$email = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	$ua->cookie_jar({ file => "$ENV{HOME}/.cookies.txt" });
	print "[+] Checking if $email is registered\n\n";
	&email_twitter($email);
}

sub email_twitter {
	$email = $_[0];
	print "[+] Twitter: ";
	$req = $ua->get("https://twitter.com/users/email_available?email=".$email);
	if ($req->decoded_content =~ /valid\"\:false/) {
		print "Registered!\n";
	} else {
		print "NO!\n";
	}
}















1;
