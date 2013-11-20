require 'test_helper'

class ProductsUserTest < ActiveSupport::TestCase
  subject { ProductsUser.new }

  # Associations
  must { belong_to(:product) }
  must { belong_to(:user) }

  # Validations
  must { validate_presence_of(:product_id) }
  must { validate_presence_of(:user_id) }
end
