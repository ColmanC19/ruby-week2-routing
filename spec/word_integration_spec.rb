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
