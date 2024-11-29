class FlashcardsController < ApplicationController
  def index
    @flashcards = current_user.flashcards
  end

  def show
    @flashcard = Flashcard.find(params[:id])
    authorize @flashcard
  end

  def new
    @flashcard = Flashcard.new
    authorize @flashcard
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)
    @flashcard.user = current_user
    if @flashcard.save
      redirect_to flashcard_path(@flashcard)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
