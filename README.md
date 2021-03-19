# README

Follow below steps to configure project:

* Clone repository using command:
  
  >> git clone https://github.com/shivam091/test-api.git

* Navigate to project directory:

  >> cd test-api

* Run command to install required plugins, gems:

  >> bundle install

* Create user in PostgreSQL

  1. Login to PostgreSQL with command:
    >> sudo -u postgres psql
  2. Create user with command:
    >> CREATE USER user_name;
  3. Grant superuser access to user using command:
    >> ALTER USER user_name WITH SUPERUSER;
  4. Set password to user using command:
    >> ALTER USER user_name WITH password 'password';
  5. Exit Psql using command:
    >> exit

* Copy database.yml.sample to database.yml using command:

  >> cp config/database.yml.sample config/database.yml

* In database.yml, change username and password of the databases for required environment

* Copy application.yml.sample to application.yml using command:

  >> cp config/application.yml.sample config/application.yml

* In application.yml, change api_key to "YOUR_API_KEY" as:

  >> api_key: "YOUR_API_KEY"

* run below command to create database:

  >> rake db:create

* run below command to run migrations:

  >> rake db:migrate

* To import all products from CSV file run:

  >> rake add_products

* Start rails server using command:

  >> rails s
 
* Hit /products api to get list of all available products

* Hit /news api to get all news articles
  
