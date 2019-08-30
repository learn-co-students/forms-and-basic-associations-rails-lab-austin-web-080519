class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  def genre_name
    self.genre ? self.genre.name : nil
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def artist_name
    self.artist ? self.artist.name : nil
  end
  def note_contents=(note_array)
    note_array.delete_if {|note| note.match(/^\s*$/)}
    note_array.each {|note| self.notes.build(content: note)}
  end
  def note_contents
    self.notes.map {|note| note.content}
  end
end
