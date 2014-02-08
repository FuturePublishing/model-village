# == Class: model_village Package
#
# model_village package.
#
class model_village::package {

  include git_configure

  $mvpackages = [ 'lxc', 'bridge-utils', 'libvirt-bin', 'debootstrap', 'puppetmaster', 'dnsmasq', 'rake' ]
  package{ $mvpackages: ensure => present }
}
