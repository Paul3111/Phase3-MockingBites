require './UnitTestingParentChildClasses/lib/music_library'
require './UnitTestingParentChildClasses/lib/track'

RSpec.describe "Integration." do
  context "When at least one entry." do
    before do
      @library1 = MusicLibrary.new
    end
    it "Returns one track." do
      @library1.add(Track.new("Song1", "Artist1").add_track)
      expect(@library1.all).to eq ["Song1 - Artist1"]
    end
    
    it "Returns all tracks added." do
      @library1.add(Track.new("Song1", "Artist1").add_track)
      @library1.add(Track.new("Song2", "Artist1").add_track)
      @library1.add(Track.new("Song3", "Artist1").add_track)
      @library1.add(Track.new("Song1", "Artist2").add_track)
      expect(@library1.all).to eq ["Song1 - Artist1", "Song2 - Artist1", "Song3 - Artist1", "Song1 - Artist2",]
    end
    
    it "Returns a list of tracks that match a keyword." do
      @library1.add(Track.new("Song1", "Artist1").add_track)
      @library1.add(Track.new("Song2", "Artist1").add_track)
      @library1.add(Track.new("Song3", "Artist1").add_track)
      @library1.add(Track.new("Song1", "Artist2").add_track)
      expect(@library1.search("Artist1")).to eq ["Song1 - Artist1", "Song2 - Artist1", "Song3 - Artist1"]
    end
    
  end
  
  context "When input is nil or empty string." do
    before do
      @library3 = MusicLibrary.new
    end
    it "Returns empty string when input is an empty string." do
      expect(@library3.add(Track.new("", "").add_track)).to eq [""]
    end
    
    it "Fails when either Song name or Artist name is nil." do
     expect {@library3.add(Track.new(nil,"Artist1").add_track)}.to raise_error "Track does not exist!"
    end
  end
  
end

