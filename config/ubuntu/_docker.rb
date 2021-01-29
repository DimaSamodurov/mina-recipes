namespace :ubuntu do
  namespace :docker do
    desc 'Setup docker'
    task :install do
      # command 'sudo apt-get update'
      script = <<~BASH
        # Script source: https://docs.docker.com/engine/install/ubuntu/

        sudo apt-get update
        sudo apt-get -y install \
          apt-transport-https \
          ca-certificates \
          curl \
          gnupg-agent \
          software-properties-common

        # Add Docker’s official GPG key
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88

        # set up the stable repository.
        sudo add-apt-repository \
           "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
           $(lsb_release -cs) \
           stable"

        sudo apt-get update
        sudo apt-get -y install docker-ce docker-ce-cli containerd.io

        # Verify that Docker Engine is installed correctly by running the hello-world image.
        sudo docker run hello-world
      BASH
      command script
    end
  end
end



