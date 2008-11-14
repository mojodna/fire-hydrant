# Fire Hydrant

Fire Hydrant is a set of tools for consuming [Fire
Eagle](http://fireeagle.yahoo.net/ "Fire Eagle")'s XMPP
[PubSub](http://xmpp.org/extensions/xep-0060.html "XEP-0060: Publish-Subscribe") feed.

## Getting Started

Install it:

    $ sudo gem install mojodna-fire-hydrant -s http://gems.github.com

Clone it (to play with):

    $ git clone git://github.com/mojodna/fire-hydrant.git

Configure it:

    $ cp fire_hydrant.yml.sample fire_hydrant.yml
    $ vi fire_hydrant.yml

_Switchboard settings are not presently used._

Add **fireeagle.com** to your roster:

    $ switchboard --jid jid@example.com --password pa55word \
      roster add fireeagle.com

Confirm that your roster contains **fireeagle.com** (in order for presence
notifications to be sent properly):

    $ switchboard --jid jid@example.com --password pa55word roster list

Subscribe to location updates corresponding to the configured token:

    $ switchboard --jid jid@example.com --password pa55word \
        pubsub --oauth \
        --oauth-consumer-key <consumer key> \
        --oauth-consumer-secret <consumer secret> \
        --oauth-token <token> \
        --oauth-token-secret <token secret> \
        --server fireeagle.com \
        --node "/api/0.1/user/<token>" \
        subscribe

Check subscriptions:

    $ switchboard --jid jid@example.com --password pa55word \
        pubsub --oauth \
        --oauth-consumer-key <consumer key> \
        --oauth-consumer-secret <consumer secret> \
        --oauth-token <general token> \
        --oauth-token-secret <general token secret> \
        --server fireeagle.com \
        subscriptions

Run it:

    $ examples/fire_eagle_consumer.rb

If you'd like to unsubscribe:


    $ switchboard --jid jid@example.com --password pa55word \
        pubsub --oauth \
        --oauth-consumer-key <consumer key> \
        --oauth-consumer-secret <consumer secret> \
        --oauth-token <token> \
        --oauth-token-secret <token secret> \
        --server fireeagle.com \
        --node "/api/0.1/user/<token>" \
        unsubscribe

## Incorporating the Fire Hydrant Into Your Application

The most basic Fire Eagle consumer looks like:

    config = YAML.load(File.read("fire_hydrant.yml"))
    hydrant = FireHydrant.new(config)

    hydrant.on_location_update do |user|
      # insert application-specific functionality here
      puts "#{user.token} has moved to #{user.locations[0].name}."
    end

    hydrant.run!

_examples/fire\_eagle\_consumer.rb_

The configuration Hash (`config`) must contain `jid`, `password`, and
`pubsub.server`, but does not need to be loaded from `fire_hydrant.yml`.

Your consumer should run as a stand-alone application, as it spawns several
threads and is intended to be a long-running process.

Also, note that running multiple instances of the consumer (each with
different resources, in order for all to be online simultaneously) will not
distribute updates across instances; **all instances will receive all
updates**.

See the [Fire Eagle gem documentation](http://fireeagle.rubyforge.org/) for
more information on how Fire Eagle information is exposed to Ruby.

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
