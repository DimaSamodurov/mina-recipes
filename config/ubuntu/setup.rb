Dir[File.join(__dir__, '_*.rb')].each { |file| require_relative file }

namespace :ubuntu do
  namespace :setup do
    desc 'Prepare server for Ruby web app deployments with Docker, Nginx and Passenger'
    task :ruby_stack do
      invoke 'ubuntu:swap_on'
      invoke 'ubuntu:deps:install'
      invoke 'ubuntu:github:enable'
      invoke 'ubuntu:docker:install'
      invoke 'ubuntu:rvm:install'
      invoke 'ubuntu:passenger:install'
    end
  end
end
