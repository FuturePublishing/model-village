define etcd::register ($key='',$value='') {

  exec{ "Etcd-set-${key}=${value}":
    path    => '/usr/bin:/bin',
    command => "curl -L http://shop:4001/v2/keys/config/${key} -XPUT -d value=${value}",
    require => Package[ 'curl' ],
  }
}
