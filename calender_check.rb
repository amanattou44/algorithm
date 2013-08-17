require "date"

file = ARGV[0]

def judgement_leap(int)
  if(Date.gregorian_leap?(int))
    puts "#{int} is a leap year"
  else
    puts "#{int} is not a leap year"
  end
end

unless file == nil
  read = open(file)
  while line = read.gets do
    judgement_leap(line.to_i)
  end
  read.close
else
  input_line = gets.to_i
  input_line.times {
    s = gets.chomp.split(",")
    if(s.length > 1)
      s.each do |v|
        judgement_leap(v.to_i)
      end
    elsif(s.length == 1)
      judgement_leap(s.first.to_i)

      return
    end
  }
end
