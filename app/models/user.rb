class User < ActiveRecord::Base
  include Clearance::User
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Callbacks
  before_validation :set_defaults

  # Associations
  belongs_to_active_hash :role

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
