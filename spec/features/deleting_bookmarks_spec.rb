feature 'deleting a bookmark' do
  scenario 'deletes a bookmark' do
    Bookmark.create(url: 'www.google.com', title: 'Google')
    Bookmark.create(url: 'www.yahoo.com', title: 'Yahoo')
    visit('/bookmarks')
    first('.bookmark').click_button('Delete')
    expect(page).to have_link('Yahoo', href: 'www.yahoo.com')
    expect(page).not_to have_link('Google', href: 'www.google.com')
  end
  
end