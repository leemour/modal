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

  def tr(model, action, gender='male')
    { notice: tr_raw(model, action, gender) }
  end

  def tr_raw(model, action, gender='male')
    t("model.#{gender}.#{action}",
      model: t("activerecord.models.#{model}", count: 1))
  end
end
