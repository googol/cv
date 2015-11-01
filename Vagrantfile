# -*- mode: ruby -*-
# vi: set ft=ruby :

# First some installation scripts, vagrant conf itself is lower down

# The base box only has the C locale installed, these should cover most uses
$generate_locales = <<SCRIPT
locale-gen fi_FI.UTF-8
locale-gen en_US.UTF-8
SCRIPT

# Set the default login location
# This script will be run as the unprivileged development user.
$configure_dotprofile = <<SCRIPT
profile_dir=~/.profile
locale="en_US.UTF-8"

export_env_if_unset() {
  if [ -z "${!1}" ]; then
    echo "export $1=$2" >> "$profile_dir"
  fi
}

source "$profile_dir"

export_env_if_unset "LANG" "$locale"
export_env_if_unset "LANGUAGE" "$locale"
export_env_if_unset "LC_ALL" "$locale"
echo "export PATH=\"~/tools/texlive/bin/x86_64-linux:\$PATH\"" >> "$profile_dir"

if [ $(pwd) != "/vagrant" ]; then
  echo "cd /vagrant" >> "$profile_dir"
fi
SCRIPT

Vagrant.configure(2) do |config|
  # The development virtual machine will run Ubuntu 14.04 Trusty Tahr
  config.vm.box = "ubuntu/trusty64"
  # Run provisioning scripts in this order.
  config.vm.provision "shell", inline: $generate_locales
  # Latex setup and environment setup need to be run
  # as the development user
  config.vm.provision "shell" do |s|
    s.privileged = false
    s.path = "vagrant/install-latex.sh"
  end
  config.vm.provision "shell" do |s|
    s.privileged = false
    s.inline = $configure_dotprofile
  end
end
