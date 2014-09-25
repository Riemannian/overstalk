overstalk
=========

Extract info from Social Networks

Need:

          Getopt::Long
          LWP::UserAgent


Simple usage
===============

-Check Social Networks in a url

          perl overstalk.pl --check=URL

You can save the output using > log.txt . This log can be used later.

-Check if a nick/username given is registered in social networks

          perl overstalk.pl --nick=NICK
          
If you saved a log of --check, you can check if any of the found usernames are registered in other social networks:

          perl overstalk.pl --process=LOG.TXT | grep "YES"



There are implemented some other functionabilities relationed with Yelp, LastFM, Flickr... This will be documentered soon.
