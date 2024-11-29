class AddDifficultyToFlashcards < ActiveRecord::Migration[7.0]
  def change
    add_column :flashcards, :difficulty, :string
  end
end
