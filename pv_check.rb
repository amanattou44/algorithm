(_, day), access_logs = ARGF.readlines.map(&:split)
logs = access_logs.map(&:to_i)
campaign = day.to_i

campaign_list_max_size = logs.each_cons(campaign).with_object([]) do |arr, result|
  result << arr.inject { |a, b| a + b }
end

list_size = 0
campaign_list_max_size.each_with_index do |val, i|
  list_size += 1 if campaign_list_max_size.max == val
end

print "#{list_size} #{campaign_list_max_size.find_index(campaign_list_max_size.max) + 1} \n"
