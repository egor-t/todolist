module TasksHelper

  def define_day(date)
    if date == Date.today
      content_tag(:p, 'Сегодня', class: 'text-success')
    elsif date == Date.tomorrow
      content_tag(:p, 'Завтра', class: 'text-info')
    else
      content_tag(:p, date, class: 'text-danger')
    end
  end
end
