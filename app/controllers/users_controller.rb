class UsersController < ApplicationController
  before_filter :require_session, only: [:cart]

  def cart
    @products = current_user.products.to_a
    @total_price = @products.sum(&:price)
  end
end
