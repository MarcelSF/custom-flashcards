class Flashcard < ApplicationRecord
  DIFFICULTIES = %w(A1 A2 B1 B2 C1 C2).freeze

  belongs_to :user
  has_many :deck_flashcards
  has_many :decks, through: :deck_flashcards
  has_rich_text :front
  has_rich_text :back

  validates :slug, presence: true, uniqueness: true
end
