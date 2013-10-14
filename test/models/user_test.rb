require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { User.new }

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
    subject { User.new(role: nil) }

    it 'must set the proper default values' do
      subject.valid?

      subject.role_id.must_equal 0
    end
  end
end
