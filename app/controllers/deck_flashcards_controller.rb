class DeckFlashcardsController < ApplicationController
  before_action :set_deck_and_flashcards, only: %i[new create]

  def new
    @deck_flashcard = DeckFlashcard.new
    authorize @deck, :edit?
  end

  def create
    authorize @deck, :edit?
    @deck_flashcard = DeckFlashcard.new(deck_flashcard_params)
    @deck_flashcard.deck = @deck
    if @deck_flashcard.save
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def deck_flashcard_params
    params.require(:deck_flashcard).permit(:flashcard_id)
  end

  def set_deck_and_flashcards
    @deck = Deck.find(params[:deck_id])
    @flashcards = current_user.flashcards - @deck.flashcards
  end
end
