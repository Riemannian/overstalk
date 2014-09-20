sub steam_main {
	$id = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	print "[+] Steam wishlist:\n\n";
	$req = $ua->get("http://steamcommunity.com/profiles/".$id."/wishlist/");
	$html = $req->decoded_content;
	@trozos = split("\n", $html);
	foreach $trozo (@trozos) {
		if ($trozo =~ m/\<h4\>(.*?)\<\/h4\>/g) {
			print "       $1\n";
		}
	}
	print "\n[+] Installed games:\n\n";
	$req = $ua->get("http://steamcommunity.com/profiles/".$id."/games/?tab=all");
	$html = $req->decoded_content;
	@trozos = split(",", $html);
	foreach $trozo (@trozos) {
		if ($trozo =~ m/name\"\:\"(.*?)\"/g) {
			print "    $1\n";
		}
	}
}































1;
