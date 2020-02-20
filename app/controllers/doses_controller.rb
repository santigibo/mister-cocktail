class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    c = Cocktail.find(params[:cocktail_id])
    d = Dose.new(params_secure)
    d.cocktail = c
    if d.save
      redirect_to cocktail_path(c)
    else
      render :new
    end
  end

  def destroy
    d = Dose.find(params[:id])
    d.destroy

    redirect_to cocktail_path(d.cocktail)
  end

  private

  def params_secure
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
