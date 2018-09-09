require 'rails_helper.rb'

feature 'Creating book' do
  scenario 'can create a book' do
    visit '/'
    click_link 'Add New Book'
    fill_in 'book_title', with: 'Ulisses'
    click_button 'Save Book'
    expect(page).to have_content('Ulisses')
  end
end
