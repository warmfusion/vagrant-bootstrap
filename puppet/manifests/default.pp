
#	$myvariable = hiera(myvar)
#	notice("My variable is: ${myvariable}")


node default {

  # Ubuntu gets out of date real quick
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  class  { 'activemq': 
  	install        => 'source',
  	install_source => 'http://archive.apache.org/dist/activemq/apache-activemq/5.8.0/apache-activemq-5.8.0-bin.tar.gz',
  	version        => '5.8.0',
  }
}