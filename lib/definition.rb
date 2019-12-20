class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(name, album_id, id)
    @name = name
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.word_id() == song_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def self.find_by_album(wrd_id)
  definitions = []
  @@definitions.values.each do |definition|
    if definition.word_id == wrd_id
      definitions.push(definition)
    end
  end
  definitions
end

  def update(name, word_id)
    self.name = name
    self.word_id = word_id
    @@definitions[self.id] = Definition.new(self.name, self.word_id, self.id)
  end

  def word
  Word.find(self.word_id)
end

  def delete
    @@definitions.delete(self.id)
  end

  def self.clear
    @@definitions = {}
  end
end
