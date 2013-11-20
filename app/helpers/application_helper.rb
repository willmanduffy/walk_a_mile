module ApplicationHelper
  def page_class
    controller.controller_name + ' ' + controller.action_name
  end
end
