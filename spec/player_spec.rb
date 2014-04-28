require 'player'
require 'board'

describe Player do
	
	let(:player){Player.new("Steve")}

	it "it should create a new player with a given name" do
		expect(player.name).to eq "Steve"
	end

	it "knows whether is has ships floating" do

		expect(player).to have_ships_still_floating
	end

	it 'can shoot at opponents board' do
		opponent = double :board #, :register_shot => :s
		expect(opponent).to receive(:register_shot)
		player.shoot("A3",opponent) 
	end

	
end

