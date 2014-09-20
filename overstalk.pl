########## overstalk.pl #############

# Author: J. M. Fernandez 
# Twitter: @TheXC3LL
# Blog: 0verl0ad.blogspot.com

####################################

use LWP::UserAgent;
use Getopt::Long;
use utf8;


push (@INC, ".");
require 'lib/sn/yelp.pl';
require 'lib/sn/lastfm.pl';
require 'lib/sn/steam.pl';
require 'lib/check.pl';
require 'lib/nick.pl';


binmode STDOUT, ':utf8';


$defined_useragent = 'Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/20131030';


GetOptions(
	"yelp=s" => \$flag_yelp,
	"eventos" => \$flag_yelp_eventos,
	"amigos" => \$flag_yelp_amigos,
	"favoritos" => \$flag_yelp_favoritos,


	"lastfm=s" => \$flag_lastfm,
	"music" => \$flag_lastfm_music,
	
	"check=s" => \$flag_check,
	"nick=s" => \$flag_nick,

	
	"steam=s" => \$flag_steam,
	);




print q(

        -=[ OverStalk ]=-                            `-.
                                                      .`
                                                   _.`.`
     http://blog.0verl0ad.com                  _.-` .`
                                       ___.---` _.-`
                               __..---`___..---`
                      _...--.-`   _.--`
                  _.-`.-`.-`  _.-`
               .-` .`  .`   .`
    .         /   /   /    /                    .
    \`-.._    |  |    \    `.              _..-`/
   .'-.._ ``--.._\     `. -- `.      _..-``  _..-`.
   `_    _       `-. .`        `. .-`      _    _`
     `.``           .            \          ``.`
      `-.-'    _   .              :   _   `-.-`
        `..-..'    ;       .` `.  '    `..-..`
            /      .      : .-. : :        \
            `._     \     ;( O ) /      _.`
              `-._.'`.    .`-'.' `._.-'
                       `-....-`


);

if ($flag_yelp) { &yelp_main($flag_yelp); }
if ($flag_lastfm) { &lastfm_main($flag_lastfm); }
if ($flag_check) { &check($flag_check); }
if ($flag_steam) { &steam_main($flag_steam); }
if ($flag_nick) { &nick_main($flag_nick); }
