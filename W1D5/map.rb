class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value]
  end

  def lookup(key)
    @map.each do |pairs|
      return pairs[1] if pairs[0] == key
    end
  end

  def remove(key)
    @map.each do |pairs|
      @map.delete(pairs) if pairs[0] == key
    end
  end

  def show
    @map
  end

end
