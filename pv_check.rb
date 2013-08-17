# 入力
# ・キャンペーンの候補数、キャンペーン日数
# 出力
# ・キャンペーン期間の候補数、キャンペーンの開始日

# 準備
input = gets
days, fast_day = input.chomp!.split(" ");
days = days.to_i
fast_day = fast_day.to_i

# 一次元配列、配列の要素数、キャンペーンの日数
def candidate(list, list_num, num)
  lump = Array.new(list_num - 1).map { Array.new }
  lump.each_with_index do |val, i|
    lump[i] = list.values_at(0..num - 1)
    list.delete_at(0)
  end
  lump.each_with_index do |arr, i|
    arr.each_with_index do |val, j|
      lump.slice!(i) if(val.nil?)
    end
  end
  return lump
end

@fast_open = Array.new
# 二次元配列
def candidate_size(list)
  list.each_with_index do |arr, i|
    max_size = arr.inject { |sum, j| sum.to_i + j.to_i } if(i == 0)
    current_size = arr.inject { |sum, j| sum.to_i + j.to_i}
    if((current_size <=> max_size) > -1)
      max_size = current_size
      @fast_open = arr
      size += 1
    end
  end
  return size
end

# 6 2 0 7 1 3 5 3 2 6
# [6,2][2,0][0,7][7,1][1,3][3,5][5,3][3,2][2,6]
# メイン実行
footprint_list = gets.chomp!.split(" ")
list = Array.new
# キャンペーン期間の候補数
candidate_num = 0

list = candidate(footprint_list, footprint_list.length, fast_day)
candidate_num = candidate_size list
print "#{candidate_num} #{@fast_open.first}\n"
