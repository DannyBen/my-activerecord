# Require all gems from the Gemfile
require 'rubygems'
require 'bundler'
Bundler.require :default, :development

# ...and then some
require 'logger'
require 'yaml'

# Require my stuff
dir = "#{File.dirname(__FILE__)}/.."
require_all "#{dir}/models/**/*.rb"
require_all "#{dir}/lib/**/*.rb"

# Configure ActiveRecord
configuration = YAML::load(IO.read('config/database.yml'))
ActiveRecord::Base.logger = Logger.new('log/active_record.log')
ActiveRecord::Base.logger.level = :info
ActiveRecord::Base.establish_connection(configuration['development'])
ActiveSupport::LogSubscriber.colorize_logging = false

# To connect to a different database at Runtime, use something like this:
# conn_config = ActiveRecord::Base.connection_config
# conn_config[:database] = 'db/new_db_name.sqlite3'
# ActiveRecord::Base.establish_connection conn_config
