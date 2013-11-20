class Product < ActiveRecord::Base
  # Associations
  has_many :products_users
  has_many :users, through: :products_users

  # Validations
  validates :name, presence: true
  validates :price, numericality: true

  # Scopes
  def self.including_cart_for(user)
    # Set user_id to impossible value if user is not present
    user_id = user.try(:id) || -1

    select("
      products.*,
      (
        SELECT COUNT(*) > 0
        FROM products_users
        WHERE products_users.product_id = products.id
          AND products_users.user_id = #{user_id}
      ) AS in_cart
    ")
  end
end
