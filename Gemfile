source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'pg'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bcrypt'
gem 'awesome_print'

gem 'exceptions-resource', github: 'xdougx/exceptions-resource', require: 'exceptions'

# gem 'pdfkit'
# gem 'wicked_pdf'

gem 'redcarpet'
gem 'rouge', github: 'jneen/rouge'

# integrations
gem 'httparty'

# file upload
# gem 'aws-sdk'
# gem 'paperclip'
gem 'mini_magick'
gem 'carrierwave'

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
  # deploy
  gem 'capistrano', '~> 2.15.5', require: false
  gem 'rvm-capistrano', require: false
  gem "capistrano-resque", "~> 0.1.0", require: false
  gem 'net-ssh', '2.7.0'

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

gem 'font-awesome-rails', '4.3.0.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
end

