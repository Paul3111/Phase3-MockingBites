# Unit tests
RSpec.describe Track do
  before do
    @track1 = Track.new("Track1", "Artist1")
  end
  it "Adds a track." do
    expect(@track1.add_track).to eq "Track1 - Artist1"
  end
  
  it "Returns true if track is found in the list." do
    expect(@track1.matches?("Track1")).to eq true
  end
  
  it "Returns false if track is not found in the list." do
    expect(@track1.matches?("Track12")).to eq false
  end
  
  it "Fails if entry is nil." do
    track2 = Track.new(nil, nil)
    expect {track2.add_track}.to raise_error "Track does not exist!"
  end
  
end