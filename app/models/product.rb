class Product < ActiveRecord::Base
  # Associations
  has_and_belongs_to_many :users

  # Validations
  validates :name, presence: true
  validates :price, numericality: true
end
