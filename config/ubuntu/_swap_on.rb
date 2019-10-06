set :swap_size, ENV['swap_size'] || '2G'

namespace :ubuntu do
  desc 'Enable swap'
  task :swap_on do
    # command 'sudo apt-get update'
    script = <<~BASH
      # https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04
      # Check the free memory and swap status:
      free -h
      sudo swapon --show

      # Set up swap
      sudo fallocate -l #{fetch(:swap_size)} /swapfile
      ls -lh /swapfile
      sudo chmod 600 /swapfile
      sudo mkswap /swapfile
      sudo swapon /swapfile

      # make permanent
      sudo cat /etc/fstab | grep swapfile
      if [ $? -eq 1 ]; then echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab ; fi

      # Check again
      sudo swapon --show
      free -h
    BASH
    command script
  end
end
