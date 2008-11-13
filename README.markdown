# Fire Hydrant

Fire Hydrant is a set of tools for consuming [Fire
Eagle](http://fireeagle.yahoo.net/ "Fire Eagle")'s XMPP
[PubSub](http://xmpp.org/extensions/xep-0060.html "XEP-0060: Publish-Subscribe") feed.

## Getting Started

Install it:

    $ sudo gem install mojodna-fire-hydrant-s http://gems.github.com

Configure it:

    $ cp fire_hydrant.yml.sample fire_hydrant.yml
    $ vi fire_hydrant.yml

_Switchboard settings are not presently used._

Configure switchboard:

    $ switchboard config jid jid@example.com
    $ switchboard config password pa55word
    $ switchboard config oauth.consumer_key asdf
    $ switchboard config oauth.consumer_secret qwerty
    $ switchboard config oauth.token asdf
    $ switchboard config oauth.token_secret qwerty
    $ switchboard config oauth.general_token asdf
    $ switchboard config oauth.general_token_secret qwerty
    $ switchboard config pubsub.server fireeagle.com

Subscribe to location updates corresponding to the configured token:

    $ switchboard pubsub subscribe

Check subscriptions:

    $ switchboard pubsub subscriptions

Run it:

    $ examples/fire_eagle_consumer.rb

If you'd like to unsubscribe:

    $ switchboard pubsub unsubscribe

## Notes and Gotchas

Subscribing to / unsubscribing from nodes is an awkward process at the moment,
as switchboard must be re-configured with each OAuth token/secret pair that
you wish to subscribe to.

If you need to authorize your application to receive updates, you can add your
OAuth consumer key to _fire\_hydrant.yml_ and run:

    $ examples/authorize.rb

You can then add the token and secret to your switchboard configuration in
order to subscribe.

Google Talk accounts do not appear to work, but Jabber.org accounts seem to
work fine. (If you plan to use this in production, you should be running your
own XMPP server and should **not** use Jabber.org.)

## Getting Help

Your best bet for help is to post a message to the Fire Eagle Yahoo! Group:
[http://tech.groups.yahoo.com/group/fireeagle/](http://tech.groups.yahoo.com/group/fireeagle/ "Fire Eagle Yahoo! Group")

## Google Earth Integration

If you're on a Mac, install [Google Earth](http://earth.google.com/ "Google Earth") and
[rb-appscript](http://appscript.sourceforge.net/rb-appscript/index.html "Ruby Appscript"):

    $ sudo gem install rb-appscript

Start Google Earth and run:

    $ examples/fire_eagle_visualizer.rb

To see your users' locations in real-time as they change.
