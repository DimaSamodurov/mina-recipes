## Provision an Ubuntu instance with Mina

Collection of scripts usually used with manual provisioning of small deployments. 

### How to use

Install mina 

    gem install mina
    
Clone repository

    git clone mina-recipes
    cd mina-recipes

Then run

    export domain='ip_or_name'
    mina ubuntu:add_user new_user='deploy'
    export user=deploy
    mina ubuntu:setup:rvm_ruby
    
Run `mina -T` for the list of available tasks.
See `config/deploy.rb` for available options and `config/ubuntu/setup.rb` for the list of recipes.

## Testing

ruby test/**/test_*.rb