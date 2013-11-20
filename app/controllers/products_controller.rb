class ProductsController < ApplicationController
  before_filter :require_session, only: [:remove]

  before_filter :find_product, only: [:remove]

  def index
    @products = Product.including_cart_for(current_user).to_a
  end

  def remove
    @product.users.delete(current_user)

    flash[:success] = "#{@product.name} successfully removed from cart"
    redirect_to cart_current_user_path
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end
end
