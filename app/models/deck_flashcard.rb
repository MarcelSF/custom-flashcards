class DeckFlashcard < ApplicationRecord
  belongs_to :deck
  belongs_to :flashcard
  validates :deck_id, uniqueness: { scope: :flashcard_id }
end
