require 'rails_helper'

RSpec.describe "CreateBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'book title' do
    book = Book.new(title: 'sample')
    expect(book.title).to eq('sample')
  end

  it 'book author' do
    book = Book.new(author: 'Bob')
    expect(book.author).to eq('Bob')
  end

  it 'book price' do
    book = Book.new(price: 14.99)
    expect(book.price).to eq(14.99)
  end

  it 'book date' do
    book = Book.new(published: '1975-04-10')
    expect(book.published.to_s).to eq('1975-04-10')
  end

  it 'creating a book with a title' do
    visit '/books/new'
    fill_in 'Title', with: 'The Great Gatsby'
    click_on 'Add Book'
    expect(page).to have_content('The Great Gatsby')
    expect(page).to have_content('Book successfully created')
    book = Book.order("id").last
    expect(book.title).to eq('The Great Gatsby')
  end

  it 'creating a book with blank title' do
    visit '/books/new'
    fill_in 'Title', with: ''
    click_on 'Add Book'
    expect(page).to have_content('Book successfully created')
  end

  it 'creating a book with an author' do
    visit '/books/new'
    fill_in 'Author', with: 'Person'
    click_on 'Add Book'
    expect(page).to have_content('Person')
    expect(page).to have_content('Book successfully created')
  end

  it 'creating a book with a price' do
    visit '/books/new'
    fill_in 'Price', with: '15'
    click_on 'Add Book'
    expect(page).to have_content('15')
    expect(page).to have_content('Book successfully created')
  end

end
