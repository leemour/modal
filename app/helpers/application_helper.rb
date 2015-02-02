module ApplicationHelper
  def title
    content_for?(:title) ? content_for(:title) : 'Modal'
  end

  def description
    content_for?(:description) ? content_for(:description) : 'Modal'
  end

  def body_class
    "#{controller_name} #{action_name}"
  end
end
