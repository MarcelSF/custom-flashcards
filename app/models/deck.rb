class Deck < ApplicationRecord
  belongs_to :user
  has_many :deck_flashcards
  has_many :flashcards, through: :deck_flashcards

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
