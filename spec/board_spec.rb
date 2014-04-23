require 'board'

describe Board do
  let (:board) {Board.new("Will") }

	it 'a row should have 10 positions' do
		expect(board.row.count).to eq 10
	end

	it 'board should have 10 rows' do
		expect(board.rows.count).to eq 10
	end

  it 'can populate board with ships' do
    board.populate("A1")
    expect(board.populate("A1")).to eq "s"
  end


  it "can insert an o into a given position" do
    board.register_shot("B3")
    expect(board.register_shot("B3")).to eq "o"
  end

  it 'initializes a new player' do
  	expect(board.owner).to eq "Will"
  end


end