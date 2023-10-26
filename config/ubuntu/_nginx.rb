namespace :ubuntu do
  namespace :nginx do
    desc 'Install Nginx'
    task :install do
      command <<~BASH
        sudo apt-get install nginx
        systemctl status nginx.service
      BASH
    end
  end
end
