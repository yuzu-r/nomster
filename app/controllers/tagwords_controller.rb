class TagwordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def show
  end

  def create
    @tagword = Tagword.create(tagword_params)
    if @tagword.valid?
      redirect_to tagwords_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @tagword = Tagword.new
  end

  def index
    @tagwords = Tagword.all
  end

  private
    def tagword_params
      params.require(:tagword).permit(:name)
    end
end
