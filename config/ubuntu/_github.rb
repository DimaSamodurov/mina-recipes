namespace :ubuntu do
  namespace :github do
    desc 'Enable access to github'
    task :enable do
      script = <<~BASH
        if ! grep github.com ~/.ssh/known_hosts > /dev/null
        then
          ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
        fi
      BASH
      command script
    end

    desc 'Configure User account to access the repository from servers.'
    task :setup_deploy_user do
      file('~/.ssh/config') do
        <<~CONFIG
        host github.com
          User git
          IdentityFile  ~/.ssh/id_rsa_deploy
        CONFIG
      end

      command %(chmod 600 ~/.ssh/id_rsa_deploy)
      command %(chmod 644 ~/.ssh/id_rsa_deploy.pub)
      command %(git config --global --add user.name "Deploy User")
    end
  end
end
