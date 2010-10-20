# EyBalancer

EyBalancer is a ruby gem that allows you to add and remove instances to/from your EngineYard AppCloud cluster programmatically.

## Setup:

* get your ENVIRONMENT_ID ([click](http://uploads.makevoid.com/ey_balance.jpg) and [copy the environment id](http://uploads.makevoid.com/ey_balance_number.jpg) as in the example pictures)
* Add EyBalance config file to your application (in config/ey_balance.yml)

## Usage

    require 'balancer'
    bal = Balancer.new
    bal.login
    
    bal.list_instances # [{:id=>"53859", :type=>:app}, {:id=>"54249", :type=>:app}]
    
    bal.set_instances_size({:app => 2, :db => 0}) # it does nothing because there are 2 app istances 
    bal.set_instances_size({:app => 3, :db => 0}) # it fires one app instance!
    
    # use these public methods to fire/terminate instances manually
    # bal.add_instance :app
    # bal.remove_instance :db


## Config file

the default location is 'config/ey_balance.yml' into your app path, it's a yaml hash:

    --- 
      account_email: 
      account_passw: 
      environment_id:

## Cronjob setup:

* Follow the steps explained in 'Setup'
* Add EyBalance gem to your bundler Gemfile or in your app's environment, commit, deploy
* create a crontab script like the one here: "scripts/ey_balance.rb"
* Go to your EY dashboard, in your environment select 'More Options' then 'Crontabs'
* Configure the crontab calling ey_balance as shown in the example: http://uploads.makevoid.com/ey_new_crontab.jpg
