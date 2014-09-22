sub flickr_main {
	$user = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	print "[+] Stalking in Flickr...\n\n";
	if ($flag_perfil) {
		&flickr_perfil($user);
	}
	if ($flag_following) {
		&flickr_following($user);
	}
}


sub flickr_perfil {
	$user = $_[0];
	print "[+] Data extracted from profile:\n";
	$req = $ua->get("https://www.flickr.com/people/".$user);
	$html = $req->decoded_content;
	if ($html =~ m/class\=\"given-name\"\>(.*?)\</g) {
		print " " x 5 . "[-] Name: $1";
	}
	if ($html =~ m/class\=\"family-name\"\>(.*?)\</g) {
		print " $1\n";
	}
	if ($html =~ m/class\=\"note\"\>(.*?)\</g) {
		print " " x 5 . "[-] Description: $1\n";
	}
}


sub flickr_following {
	$user = $_[0];
	$check = "false";
	$i = 1;
	$url = "https://www.flickr.com/people/".$user."/contacts/?filter=&page=";
	while ($check eq "false") {
		$req = $ua->get($url.$i);
		$html = $req->decoded_content;
		@trozos = split("\n", $html);
		if ($html =~ /rel\=\"contact\"\>/) {
			foreach $trozo (@trozos) {
				if ($trozo =~ m/\"\/photos\/(.*)\/\" rel\=\"contact\"\>\<im/g) {
					print "\n$1";
				}
				if ($trozo =~ m/\<h2\>(.*?)\</g) {
					print " --- $1";
					
				}
				if ($trozo =~ m/\<p\>\<b\>(.*?)\</g) {
					print " --- $1";
				}
				
			}
		$i++;
		} else { $check = "true"; }
	}
}


















1;
