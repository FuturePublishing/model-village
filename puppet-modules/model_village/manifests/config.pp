# == Class: model_village Config
#
# model_village configuration.
#
class model_village::config {

  mount { '/sys/fs/cgroup':
    ensure  => 'mounted',
    device  => 'cgroup',
    fstype  => 'cgroup',
    options => 'defaults',
    atboot  => true,
  }

  file{ '/etc/dnsmasq.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0444',
    content => ('model_village/dnsmasq.conf.erb'),
  }

  file{ '/etc/puppet/hiera.yaml':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0444',
    content => template('model_village/hiera.yaml.erb'),
  }

#  file{ '/etc/puppet/puppet.conf':
#    ensure  => present,
#    owner   => root,
#    group   => root,
#    mode    => '0444',
#    content => template('nginx_puppetmaster/puppet.conf.erb'),
#  }

  file{ '/etc/puppet/autosign.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0444',
    content => template('model_village/autosign.conf.erb'),
  }

  # Nginx/unicorn bits.
  file{ '/etc/puppet/rack':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
  }

  file{ '/etc/puppet/rack/unicorn.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0444',
    content => template('model_village/unicorn.conf.erb'),
  }

  file{ '/etc/puppet/rack/config.ru':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0444',
    content => template('model_village/config.ru.erb'),
  }
}
