class AddGenreToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :genre, :string
  end
end
