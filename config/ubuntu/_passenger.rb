namespace :ubuntu do
  namespace :passenger do
    desc 'Install Passenger'
    task :install do
      #  https://www.phusionpassenger.com/docs/advanced_guides/install_and_upgrade/nginx/install/oss/focal.html
      command <<~BASH
        sudo apt-get install -y nginx

        # Install our PGP key and add HTTPS support for APT
        sudo apt-get install -y dirmngr gnupg
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
        sudo apt-get install -y apt-transport-https ca-certificates
        
        # Add our APT repository
        sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger focal main > \
          /etc/apt/sources.list.d/passenger.list'
        sudo apt-get update
        
        # Install Passenger + Nginx module
        sudo apt-get install -y libnginx-mod-http-passenger
      BASH

      command <<~BASH
        if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; \
        then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load \
          /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
        
        sudo ls /etc/nginx/conf.d/mod-http-passenger.conf

        sudo service nginx restart
        sudo /usr/bin/passenger-config validate-install --auto

        sudo /usr/sbin/passenger-memory-stats
      BASH
    end
  end
end
