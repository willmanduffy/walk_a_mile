require 'test_helper'

describe ProductsUsersController do
  describe 'a POST to #create' do
    before do
      sign_in_as create(:user)

      @product = build_stubbed(:product)

      Product.stub(:find, @product) do
        post :create, :product_id => @product
      end
    end

    it 'must respond with a redirect' do
      assert_response :redirect
      assert_redirected_to products_path
    end
  end
end
