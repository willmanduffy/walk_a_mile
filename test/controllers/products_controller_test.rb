require 'test_helper'

describe ProductsController do
  describe 'a GET to #index' do
    before { get :index }

    it 'must respond with success' do
      assert_response :success
      assert_template :index
    end
  end

  describe 'a DELETE to #remove' do
    before do
      @user = build_stubbed(:user)
      @product = build_stubbed(:product)

      sign_in_as @user

      @user.products << @product

      Product.stub(:find, @product) do
        get :remove, product_id: @product
      end
    end

    it 'must respond with redirect' do
      assert_response :redirect
      assert_redirected_to cart_current_user_path
    end
  end
end
