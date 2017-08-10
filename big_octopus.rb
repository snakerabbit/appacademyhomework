FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
TILES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def sluggish_octopus(fishes)
  length = 0
  biggest = nil
  fishes.each do |fish|
    if fish.length > length
      length = fish.length
      biggest = fish
    end
  end
  biggest
end

class Array
  def merge_sort(&prc)
    return self if count <= 1
    prc ||= Proc.new{ |x,y| x <=> y}

    middle = count / 2
    sorted_left = self.take(middle).merge_sort(&prc)
    sorted_right = self.drop(middle).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left)
    merged.concat(right)

    merged

  end
end


def dominant_octopus(fishes)
  prc = Proc.new{|x,y| x.length <=> y.length}
  fishes.merge_sort(&prc).last
end

def clever_octopus(fishes)
  longest =""
  fishes.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end

  longest
end

def slow_dance(dir, tiles)
  tiles.each_with_index do |el, ind|
    return ind if el == dir
  end
end

TILES_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

p fast_dance("up", TILES_HASH)
