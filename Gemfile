source 'http://rubygems.org'

gem 'rails', '4.0.0'
gem 'turbolinks'
gem 'devise'
gem 'debugger', group: [:development, :test]
gem 'gmaps4rails'
gem 'underscore-rails', '~> 1.6.0'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
#  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
end
group :test do
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
end

gem 'jquery-rails'
gem 'therubyracer'              
gem 'sass-rails', "  ~> 4.0.0"
gem 'coffee-rails', "~> 4.0.0"
gem 'uglifier'
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'bootstrap_form'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
gem 'thin'
