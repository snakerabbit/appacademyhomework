class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    stones = [:stone, :stone, :stone, :stone]
    @cups.each_with_index do |sub_array, ind|
      sub_array.concat(stones) unless ind == 6 || ind == 13
    end

  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise "Invalid starting cup"
    else
      true
    end

  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      @cups[start_pos] = []
      @cups.each do |cup|
        if cup.empty? == false
          cup.concat([:stone])
        end
      end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
