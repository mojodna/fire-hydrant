## Fire Hydrant

This includes a sample consumer for Fire Eagle's preliminary XMPP pubsub node.
It does *not* appear to work with Google Talk accounts, but Jabber.org
accounts seem fine.

This requires switchboard (github.com/mojodna.net/switchboard) to be installed somewhere in your RUBYLIB.  Both should be gems, but I haven't built the gemspecs for them yet.

For Fire Eagle subscriptions to work properly, you'll have to obtain a valid
OAuth access token and put it in `fire_hydrant.yml` (use `authorize.rb` for this).

You'll also need a General Purpose access token (issued to apps that register
using 'web' auth) in order to list subscriptions. Before running the consumer,
you should add 'fireeagle.com' to your roster.

There's also the chance that our pubsub node has gone offline, which won't
help you with debugging ;-) I did mention that all of this is pre-alpha
preliminary, etc?

Please please please let me know how this works for you.

email/im: seth@mojodna.net
