require_relative '../lib/logic'

describe Logic do
  let(:logic) { Logic.new('X', 'O') }

  draw_board_test = [['X', 1, 'X'], %w[X O O], [2, 'X', 'O']]
  none_finish_board_test = [%w[X O X], ['O', 5, 'X'], ['O', 'X', 9]]
  winning_board_test = [%w[O X O], %w[X O X], %w[O X X]]
  player_board_test = [%w[X O X], %w[O X X], %w[O X X]]
  correctmove_board_test = [%w[X O X], %w[O X X], [7, 'X', 'X']]

  describe '#check_draw' do
    it 'Method should return false as not all items are strings' do
      expect(logic.check_draw(draw_board_test)).to be false
    end

    it 'Method should return true as not all items are strings' do
      expect(logic.check_draw(draw_board_test)).not_to be true
    end
  end

  describe '#check_win' do
    it 'Method should return false if theres a win combination' do
      expect(logic.check_win(draw_board_test)).to be_a NilClass
    end
    it 'Method should return true if theres a win combination' do
      expect(logic.check_win(draw_board_test)).not_to be true
    end
  end

  describe '#check_status' do
    it 'Method should return false as the array entered is still not finished' do
      expect(logic.check_status(none_finish_board_test)).not_to be true
    end
    it 'Method should return true if theres the array trows a draw' do
      expect(logic.check_status(draw_board_test)).not_to be true
    end

    it 'Method should return true if theres the array trows a win' do
      expect(logic.check_status(winning_board_test)).not_to be false
    end
  end

  describe '#numeric?' do
    it 'Method should return false if the data type given is not an integer' do
      expect(logic.numeric?('Hello World')).not_to be true
    end
    it 'Method should return true if the data type given is an integer' do
      expect(logic.numeric?(10)).not_to be false
    end
  end

  describe 'check_if_filled' do
    it 'Method should return false if the if the movement entered is open' do
      expect(logic.check_if_filled(none_finish_board_test, 9)).not_to be true
    end

    it 'Method should return true if the if the movement entered is arleady filled' do
      expect(logic.check_if_filled(none_finish_board_test, 3)).not_to be false
    end
  end

  describe 'check_move' do
    it 'Method should return the board and a true statement if there is not drawing move' do
      expect(logic.check_move(correctmove_board_test, '7',
                              true)).not_to eql([false, winning_board_test])
    end

    it 'Method should return the board and a false statement if the is not ending move' do
      expect(logic.check_move(none_finish_board_test, 9, true)).not_to eql([true, winning_board_test])
    end

    it 'Method should return the board and a true statement if there is an ending move' do
      expect(logic.check_move(correctmove_board_test, 7, true)).not_to eql([false, winning_board_test])
    end
  end

  # describe 'player_won' do
  #   it 'Method should return to check_move statement if thr is no nil' do
  #     expect(logic.player_won(correctmove_board_test, 7, true)).not_to eql([false, player_board_test])
  #   end
  #   it 'Method should return a true statement if there is nil move' do
  #     expect(logic.player_won(correctmove_board_test, nil, true)).not_to be false
  #   end
  # end
end
