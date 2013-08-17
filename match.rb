input_line = gets.to_s

arr = input_line.chomp.split(" ")
if arr[0] == arr[1]
  puts "True"
else
  puts "False"
end
