class Flashcard < ApplicationRecord
  belongs_to :user
  has_many :deck_flashcards
  has_many :decks, through: :deck_flashcards
end
