sub nick_main {
	$nick = $_[0];
	$ua = LWP::UserAgent->new; $ua->agent($defined_useragent);
	print "[+] Checking if $nick is taken: \n\n";
	&nick_facebook($nick);
	&nick_youtube($nick);
	&nick_ebay($nick);
	&nick_twitter($nick);
	&nick_myspace($nick);
	&nick_pinterest($nick);
	&nick_linkedin($nick);
	&nick_flickr($nick);
	&nick_dailymotion($nick);
	&nick_etsy($nick);
	&nick_vimeo($nick);
	&nick_hubpages($nick);
	&nick_disqus($nick);
	&nick_devianart($nick);	
	&nick_slideshare($nick);
	&nick_lastfm($nick);
	&nick_ustream($nick);
	&nick_instructables($nick);
	&nick_foursquare($nick);
	&nick_reddit($nick);
	&nick_epinions($nick);
	&nick_gather($nick);
	&nick_xing($nick);	
}

sub nick_facebook {
	$nick = $_[0];
	$req = $ua->get("https://www.facebook.com/".$nick);
	print "Facebook: ";
	if ($req->status_line !~ /404/) {
		print "YES! ( https://www.facebook.com/$nick )\n";
	} else {
		print "NO!\n";
	}
}

sub nick_youtube {
        $nick = $_[0];
        $req = $ua->get("http://www.youtube.com/user/".$nick);
        print "Youtube: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.youtube.com/user/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_ebay {
	$nick = $_[0];
	$req = $ua->get("http://www.ebay.com/usr/".$nick);
	print "Ebay: ";
	if ($req->decoded_content !~ /not found/) {
		print "YES! ( http://www.ebay.com/usr/$nick )\n";
	} else {
		print "NO!\n";
	}
}

sub nick_twitter {
	$nick = $_[0];
        $req = $ua->get("https://twitter.com/".$nick);
        print "Twitter: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://twitter.com//$nick )\n";
        } else {
                print "NO!\n";
        }
}


sub nick_myspace {
        $nick = $_[0];
        $req = $ua->get("https://www.myspace.com/".$nick);
        print "MySpace: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://www.myspace.com/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_pinterest {
        $nick = $_[0];
        $req = $ua->get("https://www.pinterest.com/".$nick);
        print "Pinterest: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://www.pinterest.com/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_linkedin {
        $nick = $_[0];
        $req = $ua->get("https://www.linkedin.com/in/".$nick);
        print "Linkedin: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://www.linkedin.com/in/$nick )\n";
        } else {
                print "NO!\n";
        }
}


sub nick_flickr {
        $nick = $_[0];
        $req = $ua->get("http://www.flickr.com/photos/".$nick);
        print "flickr: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.flickr.com/photos/$nick/ )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_dailymotion {
        $nick = $_[0];
        $req = $ua->get("http://www.dailymotion.com/".$nick);
        print "Dailymotion: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.dailymotion/$nick/ )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_etsy {
        $nick = $_[0];
        $req = $ua->get("https://www.etsy.com/es/people/".$nick);
        print "Etsy: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://www.etsy.com/es/people/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_vimeo {
        $nick = $_[0];
        $req = $ua->get("http://vimeo.com/channels//".$nick);
        print "Vimeo: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://vimeo.com/channels/$nick )\n";
        } else {
                print "NO!\n";
        }
}


sub nick_hubpages {
        $nick = $_[0];
        $req = $ua->get("http://".$nick.".hubpages.com");
        print "HubPages: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://".$nick.".hubpages.com"." )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_disqus {
	$nick = $_[0];
	$req = $ua->get("http://www.disqus.com/".$nick);
	print "Disqus: ";
	if ($req->decoded_content !~ /404/) {
		print "YES! ( http://www.disqus.com/$nick )\n";
	} else {
		print "NO!\n";
	}
}

sub nick_devianart {
        $nick = $_[0];
        $req = $ua->get("http://".$nick.".deviantart.com");
        print "Devianart: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://".$nick.".deviantart.com"." )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_slideshare  {
        $nick = $_[0];
        $req = $ua->get("http://www.slideshare.net/".$nick);
        print "SlideShare: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.slideshare.net/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_lastfm {
        $nick = $_[0];
        $req = $ua->get("http://www.lastfm.com/user/".$nick);
        print "LastFM: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.lastfm.com/user/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_ustream {
        $nick = $_[0];
        $req = $ua->get("http://www.ustream.tv/channel/".$nick);
        print "uStream: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.ustream.tv/channel/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_instructables {
	$nick = $_[0];
	$req = $ua->get("http://www.instructables.com/member/".$nick);
	print "Instructables: ";
	if ($req->status_line !~ /400/) {
		print "YES! ( http://www.instructables.com/member/$nick )\n";
	} else {
	print "NO!\n";
	}
}

sub nick_foursquare {
        $nick = $_[0];
        $req = $ua->get("https://es.foursquare.com/".$nick);
        print "FourSquare: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( https://es.foursquare.com/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_reddit($nick) {
        $nick = $_[0];
        $req = $ua->get("http://www.reddit.com/user/".$nick);
        print "Reddit: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://www.reddit.com/user/$nick )\n";
        } else {
                print "NO!\n";
        }
}



sub nick_epinions {
        $nick = $_[0];
        $req = $ua->get("http://www.epinions.com/user-".$nick);
        print "Epinions: ";
        if ($req->decoded_content !~ /not found/) {
                print "YES! ( http://www.epinions.com/user-$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_gather($nick) {
        $nick = $_[0];
        $req = $ua->get("http://gather.com/author/".$nick);
        print "Gather: ";
        if ($req->status_line !~ /404/) {
                print "YES! ( http://gather.com/author/$nick )\n";
        } else {
                print "NO!\n";
        }
}

sub nick_xing {
        $nick = $_[0];
        $req = $ua->get("https://www.xing.com/profile/".$nick);
        print "Xing: ";
        if ($req->status_line !~ /410/) {
                print "YES! ( https://www.xing.com/profile/$nick )\n";
        } else {
                print "NO!\n";
        }
}






















1;
