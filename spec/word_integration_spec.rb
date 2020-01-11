require('rspec')
require('word.rb')
require 'definition.rb'
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    save_and_open_page
    click_on('Add a new word')
    fill_in('word_name', :with => 'Funky')
    click_on('Go!')
    expect(page).to have_content('Funky')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new("Funky", nil)
    word.save
    visit("/words/#{word.id}")
    save_and_open_page
    fill_in('definition_name', :with => 'Strongly Musty')
    click_on('Add a definition to a word')
    expect(page).to have_content('Strongly Musty')
  end
end


describe '#Word' do

  before(:each) do
    Word.clear()
  end

describe '#Word' do
  describe('.all') do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("Large", nil) # nil added as second argument
      word.save()
      word2 = Word.new("Jazz", nil) # nil added as second argument
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end


describe('#==') do
  it("is the same word if it has the same attributes as another word") do
    word = Word.new("Jazz", nil)
    word2 = Word.new("Jazz", nil)
    expect(word).to(eq(word2))
  end
end

describe('.clear') do
  it("clears all words") do
    word = Word.new("Large", nil)
    word.save()
    word2 = Word.new("Jazz", nil)
    word2.save()
    Word.clear()
    expect(Word.all).to(eq([]))
  end
end

describe('.find') do
  it("finds a word by id") do
    word = Word.new("Large", nil)
    word.save()
    word2 = Word.new("Jazz", nil)
    word2.save()
    expect(Word.find(word.id)).to(eq(word))
  end
end

describe('#update') do
  it("updates a word by id") do
    word = Word.new("Large", nil)
    word.save()
    word.update("A New World")
    expect(word.name).to(eq("A New World"))
  end
end

describe('#delete') do
  it("deletes an album by id") do
    word = Word.new("Large", nil)
    word.save()
    word2 = Word.new("Jazz", nil)
    word2.save()
    word.delete()
    expect(Word.all).to(eq([word2]))
  end
end
end
end
