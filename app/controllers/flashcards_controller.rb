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
    authorize @flashcard

    @flashcard.user = current_user
    if @flashcard.save
      redirect_to flashcard_path(@flashcard)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flashcard_params
    params.require(:flashcard).permit(:front, :back, :slug, :difficulty)
  end
end
