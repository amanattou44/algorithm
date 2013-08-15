output = gets.to_i
input = gets.to_i
arr = []

input.times {
	arr << gets.to_s.chomp
	arr.sort! {|a, b| b.size <=> a.size}
	if(input == arr.length)
		for i in 0..output - 1 do
			print arr[i] + "\n"
		end
	end
}