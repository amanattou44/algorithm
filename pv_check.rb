days, logs = ARGF.readlines.map(&:split)
days.map!(&:to_i)
logs.map!(&:to_i)
campaign = days[1]

campaign_list_max_size = Array.new
logs.each_cons(campaign) do |arr|
  campaign_list_max_size.push arr.inject { |a, b| a + b }
end

list_size = 0
day_arr = Array.new
campaign_list_max_size.each_with_index do |val, i|
  if campaign_list_max_size.max == val
    list_size += 1
    day_arr.push i
  end
end

print "#{list_size} #{day_arr.first + 1} \n"
