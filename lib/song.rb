class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create   ## Custom constructor ##
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)    ## Custom constructor with name ##
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)    ## Custom constructor with name ##
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(search_name)
    self.all.detect do |song|
      song.name == search_name
    end   
  end

  def self.find_or_create_by_name(search_name)
    if self.find_by_name(search_name)
      self.find_by_name(search_name)
    else
      self.create_by_name(search_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def save
    self.class.all << self
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].chomp(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
