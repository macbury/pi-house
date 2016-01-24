package 'git-core'

git '/tmp/wiringpi' do
  repository 'git://git.drogon.net/wiringPi'
  action :checkout
  not_if { ::File.exists?('/usr/local/bin/gpio') }
end

execute 'build-wiringpi' do
  command 'cd /tmp/wiringpi && ./build'
  not_if { ::File.exists?('/usr/local/bin/gpio') }
end
