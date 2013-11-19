require 'test_helper'

describe ProductsController do
  # before { sign_in_as create(:user) }

  describe 'a GET to #index' do
    before { get :index }

    it 'must respond with sucess' do
      assert_response :success
      assert_template :index
    end
  end
end
