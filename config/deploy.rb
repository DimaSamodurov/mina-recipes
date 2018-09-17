require 'mina/git'
require 'mina/deploy'
require_relative 'ubuntu/setup'

set :domain, '18.130.126.216'
set :user, 'ubuntu' #ssh user
set :identity_file, File.expand_path('~/.ssh/my_aws.pem')

set :new_user, 'deploy' # user to be created

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-1.9.3-p125@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0 --skip-existing}
end


