feature 'update bookmark' do
  scenario 'It lets the user update bookmarks' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy') 
    visit ('/bookmarks')
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in("url", with: "http://www.youtube.com")
    fill_in("title", with: "Youtube")
    click_button("Submit")

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Youtube', href: 'http://www.youtube.com')
  end
end