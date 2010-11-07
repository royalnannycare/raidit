# IMPORTANT: This file is generated by cucumber-rails
ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../../config/environment', __FILE__)

#require 'cucumber/formatter/unicode'
require 'cucumber/rails/world'
require 'cucumber/web/tableish'

require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'
require 'cucumber/rails/capybara_javascript_emulation'

require 'factory_girl/step_definitions'

# Default is XPath, lets use CSS
Capybara.default_selector = :css

Capybara.default_host = "localhost"
Capybara.default_driver = :selenium

# Propagate errors to the tests
ActionController::Base.allow_rescue = false

# Clean up the database for pristine tests
require 'database_cleaner/cucumber'
DatabaseCleaner.orm = :mongo_mapper
DatabaseCleaner.strategy = :truncation
