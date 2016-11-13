Vagrant.configure('2') do |config|
  config.vm.box = 'hashicorp/precise64'
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision :shell, path: 'bootstrap/bootstrap.sh'
  config.vm.provision :shell, privileged: false, args: 'stable', path: 'bootstrap/install-rvm.sh'
  config.vm.provision :shell, privileged: false, args: '2.3.1', path: 'bootstrap/install-ruby.sh'
  config.vm.provision :shell, privileged: false, path: 'bootstrap/post-rvm.sh'
end
