namespace :ubuntu do
  namespace :rvm do
    desc 'Install RVM'
    task :install do
      command <<~BASH
        sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev gnupg2
      BASH

      command <<~BASH
        gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
        curl -sSL https://get.rvm.io | bash -s stable
        source ~/.rvm/scripts/rvm
        rvm info
      BASH
    end

    desc 'Install Ruby via RVM'
    task :install_ruby, [:ruby_version] do |t, args|
      ruby_version = args[:ruby_version] || fetch(:ruby_version) || '2.5.1'
      command <<~BASH
        source ~/.rvm/scripts/rvm
        rvm install #{ruby_version}
        rvm use #{ruby_version} --default
        ruby -v
      BASH
    end
  end
end
