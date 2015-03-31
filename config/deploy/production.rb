require "bundler/capistrano"
require "rvm/capistrano"

set :rails_env, 'production'
set :user, "xshirowx"
server "104.167.113.131", :web, :app, :db, primary: true
set :branch, "master"