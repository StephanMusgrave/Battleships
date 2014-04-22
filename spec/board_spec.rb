require 'board'
require 'array_methods'

describe Board do
  let (:board) {Board.new}

	it 'a row should have 10 positions' do
		expect(board.row.count).to eq 10
	end

	it 'board should have 10 rows' do
		expect(board.rows.count).to eq 10
	end

  it "can insert an x into a given position" do
    board.register_shot_at_coordinates('B',3)
    expect(board.position('B',3)).to eq "o"
  end



end