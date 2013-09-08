height, base = ARGF.readlines.map(&:split).map {|arr| arr.map(&:to_i) }.flatten

class Main
  def initialize(height = 0, base = 0)
    @height = height
    @base = base
  end
  attr_accessor :height, :base

  def get_area
    base * height / 2.0
  end
end

triangle = Main.new height, base
p triangle.get_area
