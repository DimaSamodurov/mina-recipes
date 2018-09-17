## Provision a server instance with Mina

### How to use

Install mina 

    gem install mina
    
Clone repository

    git clone mina_recipes
    cd mina_recipes

Then run

    mina ubuntu:setup domain='ip_or_name' new_user='deploy'
    
See `config/deploy.rb` for available options and `config/ubuntu/setup.rb` for the list of recipes.
