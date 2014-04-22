require 'player.rb'

describe Player do

	let(:player) {Player.new('Joey')}
	let(:player2) {Player.new('Colin')}
	let(:board) {double :board}
	
	it "has a name" do
		expect(player.name).to eq'Joey'
	end

	it "knows if ships are still floating" do
		expect(board).to receive(:hit_count)
		player.has_ships_still_floating?

	end
end

