
stage { 'system-packages': 
  before => Stage['main'] 
}

class common {
  package { [
    'vim',
    'git-core',
    'python-pip',
    'python-dev',
    'libevent1-dev',
    'ipython',
    'build-essential',
    'cython',
  ]:
    ensure => installed 
  }
}

node default {

  class { 'common':
    stage => 'system-packages'
  }

  package { 'requests':
    ensure   => '1.2.0',
    provider => pip
  }

  # gevent 0.13.8 has some DNS related issues
  package { 'gevent':
    source   => 'git://github.com/surfly/gevent.git@1.0rc2',
    ensure   => latest,
    provider => pip
  }

  exec { '/usr/bin/python setup.py install':
    cwd     => '/home/vagrant/grequests',
    require => [Package['requests'], Package['gevent']],
  }

}

