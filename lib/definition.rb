class Definition
  attr_reader :id
  attr_accessor :name, :album_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(name, album_id, id)
    @name = name
    @album_id = album_id
    @id = id || @@total_rows += 1
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.name, self.album_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_album(alb_id)
  definitions = []
  @@definitions.values.each do |definition|
    if definition.album_id == alb_id
      definitions.push(definition)
    end
  end
  definitions
end

  def update(name, album_id)
    self.name = name
    self.album_id = album_id
    @@definitions[self.id] = Definition.new(self.name, self.album_id, self.id)
  end

  def album
  Word.find(self.album_id)
end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end
