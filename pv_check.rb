(_, day), access_logs = ARGF.readlines.map(&:split)
logs = access_logs.map(&:to_i)
campaign = day.to_i

campaign_list_max_size = logs.each_cons(campaign).with_object([]) do |arr, result|
  result << arr.inject { |a, b| a + b }
end

campaign_list = campaign_list_max_size.count do |val|
  campaign_list_max_size.max == val
end

print "#{campaign_list} #{campaign_list_max_size.find_index(campaign_list_max_size.max) + 1} \n"
