# frozen_string_literal: true

def persisted_data(id:)
  PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{id};")
end
