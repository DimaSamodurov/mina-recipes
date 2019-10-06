Dir[File.join(__dir__, '_*.rb')].each { |file| require_relative file }

namespace :ubuntu do
  namespace :setup do
    desc 'Prepare Ruby server from scratch using RVM'
    task :rvm_ruby do
      invoke :'ubuntu:swap_on'
      invoke :'ubuntu:ror_deps'
      invoke :'ubuntu:rvm:install'
    end
  end
end
