namespace :ubuntu do
  desc 'Create a user'
  task :add_user, [:new_user] do |t, args|
    username = args[:new_user] || fetch(:new_user)
    script   = <<~BASH
      sudo id -u #{username}
      if [ ! $? -eq 0 ]; then
        sudo adduser #{username} --disabled-password --gecos ""
        sudo usermod -a -G sudo #{username}
        echo '#{username} ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/#{username}
      else
        echo User exists
      fi
    BASH
    command script
  end
end
