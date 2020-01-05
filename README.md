## Gogole Vision API test project



## Current features:
* Read Text from Loacl image
* Read Text from Remote image URL
* Upload image to S3


## Pre-reqs
* Ruby 2.6.0
  recommended: User RVM: https://rvm.io/rvm/install 
* PostgreSQL
 
## Installation instructions for development:
1. Clone repository
1. Run `cp config/database.yml.sample config/database.yml` (replace username with your current username)
1. Add googl_key.json to project root folder
1. Run `cp .env.sample .env` (Update variables)
1. Run `bundle install`
1. Run `bundle exec rake db:create`
1. Run `bundle exec rake db:migrate`
1. Run `rails s` to star the server

