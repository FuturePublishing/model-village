# == Class: ../modules/etcd Config
#
# etcd configuration.
#
class etcd::config {
  motd::register { 'etcd::register' : }
}
