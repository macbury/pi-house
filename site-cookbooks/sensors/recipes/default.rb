git '/tmp/codesend' do
  repository 'https://github.com/ninjablocks/433Utils'
  action :checkout
  not_if { ::File.exists?('/usr/local/bin/codesend') }
end

execute 'compile and install codesend' do
  command 'cd /tmp/codesend/RPi_utils && make && cp /tmp/codesend/RPi_utils/codesend /usr/local/bin/codesend && chmod +x /usr/local/bin/codesend'
  creates '/usr/local/bin/codesend'
end

git '/tmp/dht11' do
  repository 'https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code/'
  action :checkout
  not_if { ::File.exists?('/usr/local/bin/dht') }
end

execute 'install dht11 driver' do
  command 'cp /tmp/dht11/Adafruit_DHT_Driver/Adafruit_DHT /usr/local/bin/dht && chmod +x /usr/local/bin/dht'
  creates '/usr/local/bin/dht'
end
