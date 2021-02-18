require_relative '../lib/logic'

describe Logic do
  logic = Logic.new('X', 'O')
  draw_board_test = [['X', 1, 'X'], %w[X O O], [2, 'X', 'O']]
  none_finish_board_test = [%w[X O X], ['O', 5, 'X'], ['O', 'X', 9]]
  winning_board_test = [%w[O X O], %w[X O X], %w[O X X]]
  loosing_board_test = [%w[O X O], %w[X X X], %w[O X X]]
  correctmove_board_test = [%w[X O X], %w[O X X], ['O', 'X', 9]]

  describe '#check_draw' do
    it 'Method shall return false as not all items are strings' do
      expect(logic.check_draw(draw_board_test)).to eql(false)
    end

    it 'Method returns -----' do
      expect(logic.check_draw(draw_board_test)).not_to eql(true)
    end
  end

  describe '#check_win' do
    it 'Returns true if theres a win combination' do
      expect(logic.check_win(winning_board_test)).to be true
    end

    it 'Returns nil if theres not a win combination' do
      expect(logic.check_win(draw_board_test)).to be_a NilClass
    end
  end

  describe '#check_status' do
    it 'Returns true as the array entered is a draw' do
      expect(logic.check_status(draw_board_test)).not_to eql(true)
    end

    it 'Returns true as the array entered is a win' do
      expect(logic.check_status(winning_board_test)).to eql(true)
    end

    it 'Returns false as the array entered is unfinished' do
      expect(logic.check_status(none_finish_board_test)).to eql(false)
    end
  end

  describe '#numeric?' do
    it 'Returns true if the entered number is an integer' do
      expect(logic.numeric?(1)).to eql(true)
    end

    it 'Returns false for anything that is not an Integer' do
      expect(logic.numeric?('Hello World')).to eql(false)
    end
  end

  describe 'check_if_filled' do
    it 'Returns true if the position is filled' do
      expect(logic.check_if_filled(none_finish_board_test, 1)).to eql(true)
    end
    it 'Returns false if the position is not filled' do
      expect(logic.check_if_filled(none_finish_board_test, 5)).to eql(false)
    end
  end

  describe 'check_move' do
    it 'Returns false and the board if the move is not a ending move' do
      expect(logic.check_move(none_finish_board_test, 5, true)).to eql([false, [%w[X O X], %w[O X X], ['O', 'X', 9]]])
    end

    it 'Returns true and the board if the move is a ending move' do
      expect(logic.check_move(correctmove_board_test, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
    end

    it 'Returns true and the board if the move is a drawing move' do
      expect(logic.check_move([%w[X O X], %w[O X X], ['O', 'X', 9]], '9',
                              false)).to eql([true, [%w[X O X], %w[O X X], %w[O X O]]])
    end
  end

  describe 'player_won' do
    it 'Outputs true if move is nil' do
      expect(logic.player_won(correctmove_board_test, nil, true)).to eql(true)
    end

    it 'Returns the same as check_move is the move is not nil' do
      expect(logic.player_won(correctmove_board_test, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
    end
  end
end
