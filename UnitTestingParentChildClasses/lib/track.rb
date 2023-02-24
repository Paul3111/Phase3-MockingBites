class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def add_track
    fail "Track does not exist!" if @title == nil or @artist == nil
    if @title == "" or @artist == ""
      return @title + @artist
    else
      return @track = "#{@title} - #{@artist}"
    end
  end

  def matches?(keyword) # keyword is a string
    # Returns true if the keyword matches either the title or artist
    if @title == keyword or @artist == keyword
      return true
    else
      false
    end
  end
end