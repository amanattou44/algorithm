days, access_logs = ARGF.readlines.map(&:split)
logs = access_logs.map(&:to_i)
campaign = days[1].to_i

campaign_list_max_size = logs.each_cons(campaign).with_object([]) do |arr, result|
  result << arr.inject { |a, b| a + b }
end

list_size = 0
day_arr = []
campaign_list_max_size.each_with_index do |val, i|
  if campaign_list_max_size.max == val
    list_size += 1
    day_arr << i
  end
end

print "#{list_size} #{day_arr.first + 1} \n"
