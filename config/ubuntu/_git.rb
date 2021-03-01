namespace :ubuntu do
  namespace :git do
    desc 'Setup git'
    task :install do
      script = <<~BASH
        if ! grep github.com ~/.ssh/known_hosts > /dev/null
        then
          ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
        fi
      BASH
      command script
    end
  end
end
