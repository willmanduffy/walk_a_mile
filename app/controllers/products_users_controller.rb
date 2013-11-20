class ProductsUsersController < ApplicationController
  before_filter :require_session

  before_filter :find_product

  def create
    @products_user = ProductsUser.create!(product: @product, user: current_user)

    flash[:success] = "#{@product.name} successfully added to cart"
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end
end
