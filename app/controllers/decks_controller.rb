class DecksController < ApplicationController
  def index
    @decks = current_user.decks
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create 
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      redirect_to deck_path(@deck)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
