require './player'

describe "Player" do
  describe ".new(name)" do
    it "responds to .new" do
      expect(Player).to respond_to :new
    end

    let(:new_player) { Player.new("Rebecca") }
    it "returns name" do
      expect(new_player.name).to eq "Rebecca"
    end
  end
end
