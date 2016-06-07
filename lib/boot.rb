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
ActiveRecord::Base.establish_connection(configuration['development'])
ActiveSupport::LogSubscriber.colorize_logging = false

