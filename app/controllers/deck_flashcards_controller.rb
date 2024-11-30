class DeckFlashcardsController < ApplicationController
  def new
    @deck = Deck.find(params[:deck_id])
    @deck_flashcard = DeckFlashcard.new
    @flashcards = current_user.flashcards
    authorize @deck, :edit?
  end

  def create
    @deck = Deck.find(params[:deck_id])
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
end
