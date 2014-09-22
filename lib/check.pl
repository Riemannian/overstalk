sub check {
	$url = $_[0];
	print "[+] Checking $url...\n\n";
	$listado = &search_sn($url);
	print $listado."\n";
}

sub search_sn { 
	$url = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	$req = $ua->get($url);
	$html = $req->decoded_content;
	@trozos = split("\n",$html);
	$listado = "";
	foreach $trozo (@trozos) { 
		if ($trozo =~ m/mailto\:(.*?)\"/g) {
			$listado .= "[+] E-mail: $1#\n";
		}
		if ($trozo =~ m/https\:\/\/www\.facebook\.com\/(.*?)\"/g) { 
			if ($trozo !~ /feed/) {$listado .= "[+] Facebook: $1#\n";}
		}
		if ($trozo =~ m/http\:\/\/www\.facebook\.com\/(.*?)\"/g) {
                        if ($trozo !~ /feed/) {$listado .= "[+] Facebook: $1#\n";}
                }
		if ($trozo =~ m/https\:\/\/plus\.google\.com\/u\/0\/\+(.*?)\/po/g) {
			$listado .= "[+] Google Plus: $1#\n";
		}
                if ($trozo =~ m/http\:\/\/plus\.google\.com\/u\/0\/\+(.*?)\/po/g) {
                        $listado .= "[+] Google Plus: $1#\n";
                }

		if ($trozo =~ m/http\:\/\/twitter\.com\/(.*?)\"/g) {
			if ($trozo !~ /tweet/) {$listado .= "[+] Twitter: $1#\n";}
		}
		if ($trozo =~ m/https\:\/\/twitter\.com\/(.*?)\"/g) {
                        if ($trozo !~ /tweet/) {$listado .= "[+] Twitter: $1#\n";}
                }
		if ($trozo =~ m/http\:\/\/www\.linkedin\.com\/in\/(.*?)\"/g) {
			$listado .= "[+] LinkedIn: $1#\n";
		}
                if ($trozo =~ m/https\:\/\/www\.linkedin\.com\/in\/(.*?)\"/g) {
                        $listado .= "[+] LinkedIn: $1#\n";
                }

		if ($trozo =~ m/http\:\/\/instagram\.com\/(.*?)\"/g) {
			$listado .= "[+] Instagram: $1#\n";
		}
                if ($trozo =~ m/https\:\/\/instagram\.com\/(.*?)\"/g) {
                        $listado .= "[+] Instagram: $1#\n";
                }
		if ($trozo =~ m/http\:\/\/www\.pinterest\.com\/(.*?)\//g) {
			$listado .= "[+] Pinteres: $1#\n";
		}
                if ($trozo =~ m/https\:\/\/www\.pinterest\.com\/(.*?)\//g) {
                        $listado .= "[+] Pinteres: $1#\n";
                }
		if ($trozo =~ m/http\:\/\/www\.yelp\.es\/user_details\?userid\=(.*?)\"/g) {
			$listado .= "[+] Yelp url ID: $1#\n";
		}
                if ($trozo =~ m/https\:\/\/www\.yelp\.es\/user_details\?userid\=(.*?)\"/g) {
                        $listado .= "[+] Yelp url ID: $1#\n";
                }

		if ($trozo =~ m/http\:\/\/www\.lastfm\.es\/user\/(.*?)\"/g) {
			$listado .= "[+] LastFM: $1#\n";
		}
		if ($trozo =~ m/http\:\/\/www\.imdb\.com\/user\/(.*?)\//g) {
			$listado .= "[+] IMDB: $1#\n";
		}
		if ($trozo =~ m/https\:\/\/www\.moodyo\.com\/users\/(.*?)\"/g) {
			$listado .= "[+] MoodYo: $1#\n";
		}
		if ($trozo =~ m/http\:\/\/www\.flickr\.com\/(.*?)\"/g) {
                        $listado .= "[+] Flickr: $1#\n";
                }
               if ($trozo =~ m/http\:\/\/www\.flickr\.com\/(.*?)\"/g) {
                        $listado .= "[+] Flickr: $1#\n";
                }
		if ($trozo =~ m/flickr\.com\/photos\/(.*?)\"/g) {
                        $listado .= "[+] Flickr: $1#\n";
                }
		if ($trozo =~ m/slideshare\.net\/(.*?)\"/g) {
			print "[+] SlideShare: $1#\n";
		}
		if ($trozo =~ m/foursquare\.com\/user\/(.*?)\"/g) {
			print "[+] FourSquare: $1#\n";
		}
		if ($trozo =~ m/youtube\.com\/user\/(.*?)\"/g) {
			print "[+] Youtube: $1#\n";
		}		
		if ($trozo =~ m/xing\.com\/profile\/(.*?)\"/g) {
			print "[+] Xing: $1#\n";
		}
	}
	return $listado;
}























1;
