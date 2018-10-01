namespace :ubuntu do
  namespace :php do
    desc 'PHP 7.2'
    task :install do
      command <<~BASH
        sudo apt-get update
        sudo apt-get install -y php-fpm php-mysql
      BASH

      remote_file '/etc/php/7.2/fpm/php.ini',
           content: erb(File.join(__dir__, 'templates', '_etc_php_7.2_fpm_php.ini'))
    end
  end
end

