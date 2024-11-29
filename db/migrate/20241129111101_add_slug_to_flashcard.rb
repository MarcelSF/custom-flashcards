class AddSlugToFlashcard < ActiveRecord::Migration[7.0]
  def change
    add_column :flashcards, :slug, :string
  end
end
