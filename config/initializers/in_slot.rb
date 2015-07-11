class ActiveSupport::TimeWithZone
  def slice_slots(end_time, interval=15)
    range = []
    index=0
    while true
      break if self + interval*(index + 1).minutes > end_time
      range << {:start_time => self + index*interval.minutes, :end_time => self + interval*(index + 1).minutes}
      index+=1
    end
    range
  end
end