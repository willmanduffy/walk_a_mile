module ApplicationHelper
  def cart_count
    count = current_user.products.count

    count > 0 ? pluralize(count, 'item') : 'Empty'
  end

  def page_class
    controller.controller_name + ' ' + controller.action_name
  end
end
