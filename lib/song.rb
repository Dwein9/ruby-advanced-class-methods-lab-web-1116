class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(new_name_string)
    new_song_instance = self.new
    new_song_instance.name = new_name_string
    new_song_instance
  end

  def self.create_by_name(new_name_string)
    new_song = self.new_by_name(new_name_string)
    new_song.save
  end

  def self.find_by_name(song_name_string) #return the instance of the song
    self.all.detect { |song| song_name_string == song.name}
  end

  def self.find_or_create_by_name(song_name_string)
    find_by_name(song_name_string) || self.create_by_name(song_name_string) #find_by_name is used with string argument
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename)
    song_name_string = filename.split(" - ")[1][0..-5]
    artist_name_string = filename.split(" - ").first

    new_song = self.new_by_name(song_name_string)
    new_song.artist_name= artist_name_string
    new_song
  end

  def self.create_from_filename(filename)
    song_name_string = filename.split(" - ")[1][0..-5]
    artist_name_string = filename.split(" - ").first

    new_song = self.find_or_create_by_name(song_name_string)
    new_song.artist_name= artist_name_string
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
