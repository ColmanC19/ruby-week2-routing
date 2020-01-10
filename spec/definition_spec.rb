require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("Large", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Song.new("Big", @word.id, nil)
      definition2 = Song.new("Big", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("Large", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Big", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all songs") do
      definition = Definition.new("Large", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Big", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("Big", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("Large", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Big", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('.find_by_word') do
  it("finds definitions for a word") do
    word2 = Word.new("Jazz", nil)
    word2.save
    definition = Definition.new("Big", @word.id, nil)
    definition.save()
    definition2 = Definition.new("Massive", word2.id , nil)
    definition2.save()
    expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
  end
end

describe('#word') do
  it("finds the word a definition belongs to") do
    definition = Definition.new("Big", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end

  describe('#update') do
    it("updates a definition by id") do
      definition = Definition.new("Big", @word.id, nil)
      definition.save()
      definition.update("Obtuse", @word.id)
      expect(definition.name).to(eq("Obtuse"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Definition.new("Large", @word.id, nil)
      definition.save()
      definition2 = Definition.new("Big", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end
