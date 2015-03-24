source 'https://rubygems.org'

gem 'rails', '4.2.0'
gem 'mongoid' 
gem 'jbuilder', '~> 2.0'
gem 'bcrypt-ruby'
gem 'awesome_print'
gem 'mini_magick'
gem 'exceptions-resource', github: 'xdougx/exceptions-resource'

gem 'will_paginate'

gem 'pdfkit'
gem 'wicked_pdf'

# integrations
gem 'httparty'
# gem 'api-moip-assinaturas', :git => 'git://github.com/xdougx/api-moip-assinaturas.git', :require => 'moip'
# gem 'gattica', :git => "https://github.com/chrisle/gattica.git"
# gem 'createsend'

# resque
# gem 'redis'
# gem 'resque', :require => 'resque/server'
# gem 'resque_mailer'
# gem 'resque-scheduler', require: 'resque-scheduler'
# gem 'resque-web', :require => 'resque_web'

# file upload
# gem 'aws-sdk'
# gem 'paperclip'
gem 'carrierwave'
gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'

group :production, :staging do
  gem 'unicorn'
  gem "wkhtmltopdf-heroku", :git => 'git://github.com/camdez/wkhtmltopdf-heroku.git'
  gem 'json'
end

gem 'jquery-rails'

# the assets
group :assets do
  gem 'uglifier', '>= 1.3.0'
  gem 'sass-rails', '~> 5.0'
  gem 'coffee-rails', '~> 4.1.0'
end

group :development, :test do
  gem "rubycritic", :require => false
  gem 'brakeman', :require => false
  gem 'thin'
  gem 'wkhtmltopdf-binary', '>= 0.9.9.1'

  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support rspec-its].each do |lib|
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
  end

  gem "rails-erd"
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'mocha', :require => false
  gem 'rubocop', require: false
end

gem 'faker'
gem 'cpf_faker'
gem "factory_girl_rails", "~> 4.0"

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end



