require 'spec_helper'

describe dir

describe file('C:\\Windows\\System32\\wuapi.dll') do
  it { should be_version('10.0.14393.1066') }
end

describe file('c:/windows') do
  it { should be_directory }
  it { should be_readable }
  it { should_not be_writable.by('Everyone') }
end

describe file('c:/temp/test.txt') do
  it { should be_file }
  it { should contain "some text" }
end

describe package('Adobe Flash') do
  it { should be_installed}
end

describe service('DNSClient') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
  it { should have_start_mode("Manual") }
end

describe port(139) do
  it { should be_listening }
end

describe user('some.admin') do
  it { should exist }
  it { should belong_to_group('Administrators')}
end

describe group('Guests') do
  it { should exist }
end

describe group('MYDOMAIN\Domain Users') do
  it { should exist }
end

describe command('& "ipconfig"') do
  its(:stdout) { should match /IPv4 Address(\.| )*: 10\.10\.0\.206/ }
end

