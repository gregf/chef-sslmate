#
# Copyright:: Copyright (c) 2014, Greg Fitzgerald
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['sslmate']['account_id'] = nil
default['sslmate']['account_password'] = nil

default['sslmate']['install_type'] = 'package' # package or source
case node['platform_family']
when /debian/
  default['sslmate']['install_depends'] = %w(make libterm-readkey-perl liburi-perl libjson-pp-perl)
when /rhel|fedora/
  default['sslmate']['install_depends'] = %w(make perl-URI perl-TermReadKey perl-JSON-PP perl-Digest-SHA perl-version)
end
default['sslmate']['url'] = 'https://packages.sslmate.com/other/sslmate-latest.tar.gz'

