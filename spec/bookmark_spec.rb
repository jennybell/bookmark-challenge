require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  it 'returns all bookmarks' do
    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
    expect(bookmarks).to include("http://www.google.com")
  end
end