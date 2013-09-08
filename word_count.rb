words_list = ARGF.readlines.map(&:split)

word_count = Hash.new 0

words_list.each do |words|
  words.each do |word|
    word_count[word] += 1
  end
end

word_count.each do |word, cnt|
  puts "#{word} #{cnt}"
end
