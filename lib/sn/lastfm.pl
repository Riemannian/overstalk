sub lastfm_main {
	$user = $_[0];
	print "[+] Stalking in LastFM...\n";
	if ($flag_lastfm_music) {&lastfm_music($user);}
}

sub lastfm_music {
	$user = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	print "[+] Extracting last songs played...\n";
	$req = $ua->get("http://www.lastfm.es/user/".$user."/tracks?view=compact&page=1");
	$html = $req->decoded_content;
	@trozos = split("\n", $html);
	foreach $trozo (@trozos) {
		if ($trozo =~ m/\/music\/(.*?)\</g) {
			$trozo =~ s|<.+?>||g;
			if ($trozo !~ /Temas gratuitos/) {print $trozo."\n";}
		 }
	}

	print "\n[+] Favourite artists (TOP 30)\n\n";
	$req = $ua->get("http://www.lastfm.es/user/".$user."/charts?subtype=artists");
	$html = $req->decoded_content;
	@trozos = split("\n", $html);
	$i = 1;
	foreach $trozo (@trozos) {
		if ($i < 31) {
		if ($trozo =~ m/subjectCell\" title\=\"(.*?)\"/g) {
			print " [$i] - $1\n";
		$i++;} } 
	}
}






































1;
