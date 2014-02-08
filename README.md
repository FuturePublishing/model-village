model-village
=============

Agricultural code for agricultural people.

Current status - some assembly required.

However, the sheet of paper with the Ikea-style pictograms is conspicuous by its absence.

The model_village module allegedly works.
The etcd module ditto, although it would obviously be much better as a provider-thingy.
Some of the other bits are provided more for entertainment value.


TODO:

Lots of polish.

HOWTO:

Find/generate a host box. I used a(n) XCP VM. M'colleague Dan Slinky has it working in a Virtual Box example. As long as
LXC will install and pass its self-test, you're good.

If you have a puppetmaster handy, then the model_village module _should_ configure it. Obviously you should consider
changing '*.village.future.dom.ain' to a subdomain within your own structure.

DNSMasq doesn't need much in the way of configuration.

The lxc-future template is a guide. It works, but your LXC host probably isn't called 'shop.village...' and you're more
than likely not going to be using our Kerberos or Stomp broker rigs. It should live in /usr/share/lxc/templates.

If you keep the nodelist/Rakefile structure as-is, you can type things like 'rake make_nodes[nodelists/efs_test]

That is, if you had a copy of our hiera tree and puppet manifest. Substitute a couple of your own machines, it'll work
much better that way.

The first run while LXC generates the local Debian image is quite slow. You can make it faster by running a local
apt-cache. If you hack on the template, you'll need to remove the image to force a rebuild. It lives in /var/cache/lxc.

For even more speed, you can use Nginx/Unicorn as a puppetmaster proxy. The bits are all there.
