input = gets.to_i

def fibonacci(n)
  if n < 2
    return n
  else
    return fibonacci(n - 2) + fibonacci(n - 1)
  end
end

input.times do
  puts fibonacci(gets.to_i)
end
