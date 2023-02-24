class MusicLibrary
  def initialize
    @tracks_list = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @tracks_list << (track)
  end

  def all
    # Returns a list of track objects
    @tracks_list
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks that match the keyword
    @tracks_list.select {|track| track.include?(keyword)}
    # Kay used the actual method name from track.rb
    #return @tracks.select do |track|
    #  track.matches?(keyword)
    #end
  end
end