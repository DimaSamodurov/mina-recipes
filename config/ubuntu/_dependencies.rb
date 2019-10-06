namespace :ubuntu do
  desc 'Install some Ruby on Rails dependencies'
  task :ror_deps do
    command <<~BASH
      sudo apt install curl
      curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
      curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
      echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
      
      sudo apt-get update
      sudo apt-get install -y git-core zlib1g-dev build-essential \
        libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
        libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common \
        libffi-dev nodejs yarn
    BASH
  end
end
