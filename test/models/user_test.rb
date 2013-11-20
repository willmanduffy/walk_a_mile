require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { User.new }

  # Associations
  must { have_many(:products).through(:products_users) }
  must { have_many(:products_users) }

  # Validations
  describe 'uniqueness' do
    before { create(:user) }

    must { validate_uniqueness_of(:email) }
  end

  # Methods
  describe 'admin?' do
    context 'when the user is an admin' do
      subject { build_stubbed(:admin_user) }

      it 'must respond with true' do
        assert subject.admin?
      end
    end

    context 'when the user is not an admin' do
      subject { build_stubbed(:user) }

      it 'must respond with false' do
        refute subject.admin?
      end
    end
  end

  # Behavior
  describe 'set_defaults' do
    subject { build(:user, role: nil) }

    it 'must set the proper default values' do
      subject.valid?

      subject.role.must_equal Role.user
    end
  end
end
