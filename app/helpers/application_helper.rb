module ApplicationHelper
  def title(text)
    text.empty? ? 'Modal': text
  end

  def description(text)
    text.empty? ? 'Modal' : text
  end

  def body_class
    "#{controller_name} #{action_name}"
  end
end
