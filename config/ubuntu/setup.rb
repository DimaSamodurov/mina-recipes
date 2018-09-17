Dir[File.join(__dir__, '_*.rb')].each { |file| require_relative file }

def with_new_user(script)
  new_user = fetch(:new_user)
  return script if new_user.to_s.strip.empty?
  "sudo su #{new_user} \n" + script
end

namespace :ubuntu do
  task :setup do
    invoke :'ubuntu:swap_on'
    invoke :'ubuntu:deps'
    invoke :'ubuntu:add_user', fetch(:new_user)
    invoke :'ubuntu:rvm'
  end
end
