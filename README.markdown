## Switchboard 

Fire Hydrant / Switchboard is a toolkit for assembling XMPP clients.

It comes with some example instances that handle roster and pubsub
subscription management. (They should take command-line arguments but don't
yet; fix your `fire_hydrant.yml` with appropriate settings). You'll need
`RUBYLIB=lib/` for it to work.

## Fire Hydrant

This includes a sample consumer for Fire Eagle's preliminary XMPP pubsub node.
It does *not* appear to work with Google Talk accounts, but Jabber.org
accounts seem fine.

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