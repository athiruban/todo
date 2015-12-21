# this should be moved to client side in future

class TimeDiff
  def self.format(secs)
    # days /
    # hours # minutes
    if (secs / (60 * 60 * 24)) > 0
      return "#{secs / (60 * 60 * 24)} days ago"
    else
      hour = min = hour_f = 0
      hour = secs / (60 * 60)
      hour_f = secs % (60 * 60)
      if hour_f > 0
        min = secs / 60
      end
      return "#{hour} hours, #{min} mins ago" if hour_f > 0
      return "#{min} mins ago"
    end
  end
end