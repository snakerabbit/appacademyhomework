class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence(input_seq)
    if @game_over == false
      self.round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    self.add_random_color
    @seq
  end

  def require_sequence(input_seq)
    return true if input_seq == @seq
    false
  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "You win this round!"
  end

  def game_over_message
    puts "You lost!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
