# A dummy plugin for Barge to set hostname and network correctly at the very first `vagrant up`
module VagrantPlugins
  module GuestLinux
    class Plugin < Vagrant.plugin("2")
      guest_capability("linux", "change_host_name") { Cap::ChangeHostName }
      guest_capability("linux", "configure_networks") { Cap::ConfigureNetworks }
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.define "jubatus-barge"

  config.vm.box = "ailispaw/barge"

  config.vm.hostname = "jubatus-barge"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision :docker do |docker|
    docker.pull_images "ailispaw/ubuntu-essential:14.04-nodoc"
    docker.build_image "/vagrant", args: "-t ailispaw/jubatus"
    docker.build_image "/vagrant", args: "-t ailispaw/jubatus-client -f /vagrant/Dockerfile.client"
  end

  config.vm.provision :shell, run: "always" do |sh|
    sh.privileged = false
    sh.inline = <<-EOT
      sudo pkg install git
      git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
    EOT
  end
end
