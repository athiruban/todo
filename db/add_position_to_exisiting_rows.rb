
$a = Activity.where(:status => "open").order(:created_at => :desc)

def migrate_position_value_for_exising_records
  cur_date = nil
  index = 1

  $a.each do |activity|
    # if (cur_date) && (activity.created_at) && (cur_date != activity.created_at.to_date)
    #   index = 1
    # end
    # cur_date = activity.created_at.to_date
    activity.position = index 
    index += 1
    activity.save!
  end
end

migrate_position_value_for_exising_records

$a = Activity.order(:created_at => :desc)

$a.each do |a|
  print "#{a.id} : #{a.created_at} : #{a.position} : #{a.status} \n"
end