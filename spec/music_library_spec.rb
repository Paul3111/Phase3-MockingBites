RSpec.describe "Integration." do
  context "When at least one entry." do
    before do
      @library1 = MusicLibrary.new
      @fake_track_1 = double :fake_track_1, add_track: "Song1 - Artist1"
      # Kay used:
        # track_1 = double :track
        # expect(track_1).to receive(:matches?).with("two").and_return(true)
      @fake_track_2 = double :fake_track_1, add_track: "Song2 - Artist1"
      @fake_track_3 = FakeTrack3.new
      @fake_track_4 = FakeTrack4.new
    end
    it "Returns one track." do
      @library1.add(@fake_track_1.add_track)
      expect(@library1.all).to eq ["Song1 - Artist1"]
    end
    
    it "Returns all tracks added." do
      @library1.add(@fake_track_1.add_track)
      @library1.add(@fake_track_2.add_track)
      @library1.add(@fake_track_3.add_track)
      @library1.add(@fake_track_4.add_track)
      expect(@library1.all).to eq ["Song1 - Artist1", "Song2 - Artist1", "Song3 - Artist1", "Song1 - Artist2",]
    end
    
    it "Returns a list of tracks that match a keyword." do
      @library1.add(@fake_track_1.add_track)
      @library1.add(@fake_track_2.add_track)
      @library1.add(@fake_track_3.add_track)
      @library1.add(@fake_track_4.add_track)
      expect(@library1.search("Artist1")).to eq ["Song1 - Artist1", "Song2 - Artist1", "Song3 - Artist1"]
      # Kay used:
      # expect(music_library.search("two")).to eq [track_1]
    end
    
  end
  
  context "When input is nil or empty string." do
    before do
      @library3 = MusicLibrary.new
      @fake_track_5 = FakeTrack5.new
      @fake_track_6 = FakeTrack6.new
    end
    it "Returns empty string when input is an empty string." do
      expect(@library3.add(@fake_track_5.add_track)).to eq [""]
    end
    
    it "Fails when either Song name or Artist name is nil." do
     expect {@library3.add(@fake_track_6.add_track)}.to raise_error "Track does not exist!"
    end
  end
  
end

#class FakeTrack1
#  def add_track
#    return "Song1 - Artist1"
#  end
#end

#class FakeTrack2
#  def add_track
#    return "Song2 - Artist1"
#  end
#end

class FakeTrack3
  def add_track
    return "Song3 - Artist1"
  end
end

class FakeTrack4
  def add_track
    return "Song1 - Artist2"
  end
end

class FakeTrack5
  def add_track
    return ""
  end
end

class FakeTrack6
  def add_track
    fail "Track does not exist!"
  end
end