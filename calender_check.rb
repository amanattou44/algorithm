require "date"

_, *years = ARGF.readlines.map(&:chomp).map(&:to_i)

years.each do |year|
  if Date.gregorian_leap?(year)
    puts "#{year} is a leap year"
  else
    puts "#{year} is not a leap year"
  end
end
