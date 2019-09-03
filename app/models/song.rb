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

  def note_contents=(content)
    content.each do |c|
      self.notes << Note.find_or_create_by(content: c)
    end
    self.notes.map {|n| n.content}
  end
  
  def note_contents
    content = []
    self.notes.each do |n|
      if !(n.content.length == 0)
        content << n.content
      end
    end
    content
  end


end
