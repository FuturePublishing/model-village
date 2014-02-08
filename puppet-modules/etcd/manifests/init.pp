# == Class: etcd
#
# etcd puppet hiera module.
#
# === Examples
#
#  include etcd
#  or
#  class { 'etcd': }
#
# === Authors
#
# Future IT Operations <list.itoperation@futurenet.com>
#
class etcd {

  anchor{ 'etcd::start': } ->
  class { 'etcd::package': } ~>
  class { 'etcd::config': } ~>
  class { 'etcd::service': } ~>
  anchor{ 'etcd::end': }

}
