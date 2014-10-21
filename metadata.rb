maintainer        'Greg Fitzgerald'
maintainer_email  'greg@gregf.org'
license           'Apache 2'
description       'Chef cookbook for sslmate'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'
name              'sslmate'

recipe 'default', 'Installs sslmate'

%w(debian ubuntu centos).each do |os|
  supports os
end
