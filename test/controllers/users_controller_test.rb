require 'test_helper'

describe UsersController do
  before { sign_in_as build_stubbed(:user) }

  describe 'a GET to #cart' do
    before { get :cart }

    it 'must respond with success' do
      assert_response :success
      assert_template :cart
    end
  end
end
