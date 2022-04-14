require './app.rb'
require './lib/bookmark.rb'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'should display an array of bookmarks - seperated' do
      bookmark = Bookmark.create(title:'Makers', url: 'http://www.makersacademy.com')
      Bookmark.create(title:'Google', url: 'http://www.google.com')
      Bookmark.create(title:'Destroy', url: 'http://www.destroyallsoftware.com')
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'youtube', url: 'http://youtube.com')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'youtube'
      expect(bookmark.url).to eq 'http://youtube.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'youtube', url: 'http://youtube.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it "Updates the bookmark with the given data" do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      update_bookmark = Bookmark.update(id: bookmark.id, url: 'https://youtube.com', title: 'Youtube')
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq bookmark.id
      expect(bookmark.title).to eq 'Youtube'
      expect(bookmark.url).to eq 'http://youtube.com'
    end
  end

  describe '.find' do
    it 'returns the reuested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(bookmark.id).to eq bookmark.id
      expect(bookmark.title).to eq 'Makers Academy'
      expect(bookmark.url).to eq 'http://makersacademy.com'
    end
  end
end