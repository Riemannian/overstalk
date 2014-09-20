sub yelp_main() {
	$user = $_[0];
	print "[+] Stalking in Yelp... \n\n";

	if ($flag_yelp_eventos) {&yelp_eventos($user);}
	if ($flag_yelp_amigos) {&yelp_amigos($user); }
	if ($flag_yelp_favoritos) {&yelp_favoritos($user); }
}

sub yelp_eventos() {
	$url = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	$req = $ua->get("http://www.yelp.es/user_details_events?userid=".$url);
	$html = $req->decoded_content;
	@trozos = split("\n", $html);
	foreach $trozo (@trozos) {
		if ($trozo =~ m/\"\>(.*?)\<\/a\> \<\/h4\>/g) {
			print "EVENTO: $1\n";
		}
		if ($trozo =~ m/\<strong\>(.*?)\<\/strong\>/g) {
			print "FECHA: $1\n";
		}
		if ($trozo =~ m/biz\/(.*?)\"\>/g) {
			$req = $ua->get("http://www.yelp.es/biz/$1");
			$html = $req->decoded_content;
			if ($html =~ m/\<span itemprop\=\"streetAddress\"\>(.*?)\<\/span\>/g) {
				print "LUGAR: $1--------";
			}
			if ($html =~ m/\<span itemprop\=\"addressLocality\"\>(.*?)\<\/span\>/g) {
				print "$1\n\n";
			}
		}
	}
}

sub yelp_amigos {
	print "[+] Extracting friends...\n\n";
	$check = 0;
	$i = 0;
	$id = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent); 
	while ($check == 0) { 
		$req = $ua->get("http://www.yelp.es/user_details_friends?sort=time_last_reviewed&userid=".$id."&start=".$i);
		$html = $req->decoded_content;
		@trozos = split("\n", $html);
		foreach $trozo (@trozos) {
			if ($trozo =~ m/Perfil de (.*?) \|/g) {
				$propio = $1;
			}
			if ($trozo =~ m/\<a href\="http\:\/\/www\.yelp\.es\/user_details\?userid\=(.*?)\"\>/g) {	
				$amigo_id = $1;
				if ($amigo_id ne $amigo_anterior) {
					print "$amigo_id --- ";
				}
				$amigo_anterior = $amigo_id;
			}
			if ($trozo =~ m/\<img alt\=\"Foto de (.*?)\"/g) {
				$foto = $1;
				if ($foto ne $propio) {print "$foto --- ";}
			}
			if ($trozo =~ m/\<li class\=\"user-location\"\>(.*?)\<\//g) {
				print "$1\n";
			}
		}
		$i = $i + 100;
		if ($html =~ m/Alicia no tiene amigos/g) { $check = 1; }
	}
}


sub yelp_favoritos {
	print "[+] Lugares favoritos\n";
	$id = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	$req = $ua->get("http://www.yelp.es/user_details_bookmarks?userid=".$id);
	$html = $req->decoded_content;
	@trozos = split("\n", $html);
	foreach $trozo (@trozos) {
		if ($trozo =~ m/\<a href\=\"\/biz\/(.*?)\?/g) {
           	     $req = $ua->get("http://www.yelp.es/biz/$1");
                     $html = $req->decoded_content;
                     if ($html =~ m/\<span itemprop\=\"streetAddress\"\>(.*?)\<\/span\>/g) {
    		             print "LUGAR: $1--------";
                        }
                     if ($html =~ m/\<span itemprop\=\"addressLocality\"\>(.*?)\<\/span\>/g) {
                                print "$1\n";
                        }

		}
	}
}











1
