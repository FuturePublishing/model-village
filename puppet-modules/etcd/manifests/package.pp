# == Class: ../modules/etcd Package
#
# etcd package.
#
class etcd::package {
  package { 'curl': ensure => present }
}
