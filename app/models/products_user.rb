class ProductsUser < ActiveRecord::Base
  # Associations
  belongs_to :product
  belongs_to :user

  # Validations
  validates :product_id, presence: true
  validates :user_id, presence: true
end
