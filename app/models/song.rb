class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #creating custom setter for artist name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #creating custom getter for artist name
  def artist_name
    self.artist ? self.artist.name : nil
  end

  #creating custom setter for genre name
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #creating custom getter for genre name
  def genre_name
    self.genre ? self.genre.name : nil
  end

  #set notes for a song
  def note_contents=(contents)
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      self.notes << note #add to existing notes
    end
  end
  
  #notes getter
  def note_contents
    contents = self.notes.map {|note| note.content}
    contents.reject {|content| content.empty?} #ignore blank notes
  end

end


