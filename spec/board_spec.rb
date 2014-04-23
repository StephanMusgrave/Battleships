require 'board'

describe Board do
  let (:board) {Board.new("Will") }

  it 'initializes a new player' do
  	expect(board.owner).to eq "Will"
  end

  context "Initializing Board" do
    it 'a row should have 10 positions' do
    expect(board.row.count).to eq 10
    end

    it 'board should have 10 rows' do
      expect(board.rows.count).to eq 10
    end

    it 'can convert A1 format to array coordinates' do
      expect(board.convert_coordinates("A1")).to eq([0,0])
    end

    it 'can populate board with ships' do
      board.place_ship(1, "horizontal", "A1")
      expect(board.position("A1")).to eq "s"
    end

    it 'can place a ship on a row' do
      board.place_ship(3, "horizontal", "A1")
      expect(board.position("A1")).to eq 's'
      expect(board.position("B1")).to eq 's'
      expect(board.position("C1")).to eq 's'
    end

    it 'can place a ship on a column' do
      board.place_ship(4, "vertical", "F2")
      expect(board.position("F2")).to eq 's'
      expect(board.position("F3")).to eq 's'
      expect(board.position("F4")).to eq 's'
      expect(board.position("F5")).to eq 's'
    end

    xit "it can't place a ship outside the board" do
      expect{board.place_ship(4, "horizontal", "A8")}.to raise_error(RuntimeError)
    end

    it "has an inventory of ships" do
      expect(board.inventory).to eq ({:destroyer => 3, :submarine => 2})
    end

    it "can place a ship starting at a random point and in a random direction" do
      
    end
  end
  
  context "Playing the game" do
    
    it "can hit water" do
      # board.register_shot("B3")
      expect(board.register_shot("B3")).to eq "o"
    end

    it 'can hit a ship' do
      board.place_ship(1, "horizontal", "J3")
      # board.register_shot("J3")
      expect(board.register_shot("J3")).to eq "x"
    end 

    it 'shows the openents view of my board without ships' do
      board.place_ship(1, "horizontal", "A3")
      expect(board.opponent_view.include?("s")).to be_false
    end



  end

end