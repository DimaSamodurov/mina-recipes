namespace :ubuntu do
  namespace :deps do
    desc 'Install Ruby dependencies'
    task :install do
      command <<~BASH
        sudo apt install -y curl

        sudo apt-get update
        sudo apt-get install -y git-core zlib1g-dev build-essential \
          libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
          libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common \
          libffi-dev \
          libpq-dev
      BASH
    end
  end
end
