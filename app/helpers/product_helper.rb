module ProductHelper
  def cart_count
    count = current_user.products.count

    count > 0 ? pluralize(count, 'item') : 'Empty'
  end

  def cart_link_for(product)
    if product.in_cart?
      link_to 'Remove From Cart',
        product_remove_path(product),
        method: :delete,
        class: 'btn btn-danger',
        role: 'button'
    else
      link_to "$#{product.price} - Add to Cart",
        products_users_path(:product_id => product.id),
        method: :post,
        class: 'btn btn-primary',
        role: 'button'
    end
  end
end
