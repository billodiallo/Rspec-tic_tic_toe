require_relative '../lib/settings'

describe Settings do
  let(:new_setting) { Settings.new }

  test_array_wrong = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  test_array_correct = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  describe '#get_players' do
    it 'Must return the symbol for the second player' do
      expect(new_setting.get_players('O')).to eql('X')
    end
    it 'Must return the worng symbol to assert' do
      expect(new_setting.get_players('Y')).not_to eql('X')
    end
  end

  # describe '#make_board' do
  #   it 'Must return a none empty board' do
  #     expect(new_setting.make_board).not_to eql(test_array_wrong)
  #   end

    it 'Must return a correct empty board' do
      expect(new_setting.make_board).to eql(test_array_correct)
    end
  end
end
