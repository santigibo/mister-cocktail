class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    Cocktail.create(params_secure)

    redirect_to cocktails_path#(:id)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def params_secure
    params.require(:cocktail).permit(:name)
  end
end
