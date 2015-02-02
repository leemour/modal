module ApplicationHelper
  def title
    content_for?(:title) ? content_for(:title) : 'Modal'
  end

  def description
    content_for?(:description) ? content_for(:description) : 'Modal'
  end
end
