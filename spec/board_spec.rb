require 'board'

describe Board do

	it 'a row should have 10 positions' do
		board = Board.new
		expect(board.row.count).to eq 10
	end

	it 'board should have 10 rows' do
		board = Board.new
		expect(board.rows.count).to eq 10
	end


end