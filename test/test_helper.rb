ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/matchers'
require 'minitest/rails'
require 'clearance/testing'

class MiniTest::Rails::ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
