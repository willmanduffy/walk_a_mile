class User < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  include Clearance::User

  # Callbacks
  before_validation :set_defaults

  # Associations
  belongs_to_active_hash :role

  has_many :products, through: :products_users
  has_many :products_users

  # Validations
  validates :role, inclusion: { in: Role.all }

  # Delegations
  delegate :admin?, to: :role

  private

  def set_defaults
    self.role ||= Role.user

    true
  end
end
