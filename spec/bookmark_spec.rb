require 'bookmark'

describe Bookmark do
  describe '.all' do
    subject(:bookmark) { described_class.new }

    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
      Bookmark.create(url: "http://www.google.com", title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark.id).to eq(persisted_data[0]['id'])
      expect(bookmark.url).to eq('http://www.testbookmark.com')
      expect(bookmark.title).to eq('Test Bookmark')
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark1 = Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
      bookmark2 = Bookmark.create(url: "http://www.google.com", title: 'Google')

      Bookmark.delete(id: bookmark1.id)

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(1)
      expect(bookmarks.first.id).to eq(bookmark2.id)
      expect(bookmarks.first.title).to eq(bookmark2.title)
      expect(bookmarks.first.url).to eq(bookmark2.url)
    end
  end
end
