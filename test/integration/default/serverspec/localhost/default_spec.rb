
require 'spec_helper'
describe package('sslmate') do
  it { should be_installed }
end

describe file('/root/.sslmate') do
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into'root' }
end
