require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  subject { Product.new }

  # Associations
  must { have_many(:products_users) }
  must { have_many(:users).through(:products_users) }

  # Valiations
  must { validate_numericality_of(:price) }

  must { validate_presence_of(:name) }

  # Scopes
  describe 'self.including_cart_for' do
    before { @products = create_list(:product, 2) }

    context 'when a user is provided' do
      before do
        @user = build_stubbed(:user)
        @user.products << @products.first
      end

      subject { Product.including_cart_for(@user) }

      it 'must return the products with their cart state' do
        subject.must_equal @products

        assert subject.first.in_cart?
        refute subject.last.in_cart?
      end
    end

    context 'when a user is not provided' do
      subject { Product.including_cart_for(nil) }

      it 'must return the products in provided scoped state' do
        subject.must_equal @products

        refute subject.first.in_cart?
      end
    end
  end
end
