class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
    
  #setter 
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
    
  #getter
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(content)
      content.each do |c|
      self.notes << Note.find_or_create_by(content: c)
      self.notes.map {|n| n.content} 
    end
  end

  def note_contents
    contents = []
    self.notes.each do |n| 
      just_contents = n.content
      if !n.content.empty?
        contents << just_contents
      end
    end
      contents
    
  end


end