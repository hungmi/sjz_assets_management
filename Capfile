require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
require 'capistrano/rbenv'
# require 'capistrano/chruby'
# require 'capistrano/rails/assets'
# require 'capistrano/rails/migrations'
# Include capistrano-rails
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/nginx'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'capistrano/upload-config'# Load DSL and set up stages

# require 'capistrano/rbenv'
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.3.3'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
