module Activity::DateFormater
  def self.format_time(date)
    if (date == 1.days.ago.to_date)
      return "Yesterday" 
    elsif (date == 0.days.ago.to_date) 
      return "Today" 
    else
      return date.strftime("%b-%d-%y")
    end
  end
end