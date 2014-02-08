# == Class: model_village
#
# model_village puppet hiera module.
#
# === Examples
#
#  include model_village
#  or
#  class { 'model_village': }
#
# === Authors
#
# Future IT Operations <list.itoperation@futurenet.com>
#
class model_village {

  anchor{'model_village::start':} ->
  class { 'model_village::package': } ~>
  class { 'model_village::config': } ~>
  class { 'model_village::service': } ~>
  anchor{'model_village::end':}
}
