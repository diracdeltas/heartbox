# -*- mode: ruby; -*-
Vagrant.configure("2") do |config|
  config.vm.guest = :freebsd
  config.vm.box_url = "http://files.wunki.org/freebsd-10.0-amd64-wunki.box"
  config.vm.box = "freebsd-10.0-amd64-wunki"
  config.vm.network "private_network", ip: "10.0.1.10"
  config.vm.synced_folder ".", "/vagrant", :disabled => true

  # Use NFS as a shared folder
  config.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8081

  config.vm.provision :shell, :path => "install.sh"

  config.vm.provider :virtualbox do |vb|
    # vb.customize ["startvm", :id, "--type", "gui"]
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
  end
end
