require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase
  include ActionView::Helpers::TextHelper
  include ApplicationHelper

  describe 'cart_count' do
    context 'when there are no products in the cart' do
      it 'must retun the proper placeholder text' do
        cart_count.must_equal 'Empty'
      end
    end

    context 'when there are items in the cart' do
      before do
        @current_user = build_stubbed(:user)
        @current_user.products << create(:product)
      end

      it 'must return the number of items in the cart' do
        cart_count.must_equal '1 item'
      end
    end
  end

  private

  def current_user
    @current_user ||= build_stubbed(:user)
  end
end
