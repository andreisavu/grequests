
node default {

  Package { ensure => installed }

  package { 'vim': }
  package { 'git-core': }
  package { 'python-pip': }
  package { 'python-dev': }
  package { 'libevent1-dev': } 

}

