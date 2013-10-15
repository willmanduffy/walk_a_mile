require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  subject { Product.new }

  # Associations
  # It appears that the minitest version of shoulda-matchers currently has Rails 4 issues
  # must { have_and_belong_to_many(:users) }

  # Valiations
  must { validate_numericality_of(:price) }

  must { validate_presence_of(:name) }
end
