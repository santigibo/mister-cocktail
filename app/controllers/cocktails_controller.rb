class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    c = Cocktail.new(params_secure)
    if c.valid?
      c.save
      redirect_to cocktail_path(c)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def params_secure
    params.require(:cocktail).permit(:name, :photo)
  end
end
