namespace :ubuntu do
  namespace :nvm do
    desc 'Install NVM'
    task :install do
      command <<~BASH
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
        source ~/.nvm/nvm.sh
        nvm --version
      BASH
    end

    desc 'Install Node via NVM'
    task :install_node, [:node_version] do |t, args|
      node_version = args[:node_version] || fetch(:node_version)
      command <<~BASH
        source ~/.nvm/nvm.sh
        nvm install #{node_version}
        nvm use #{node_version} --default
        node -v
      BASH
    end
  end
end
