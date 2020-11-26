class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.new
  end

  def create
    @doses = Dose.new(doses_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses.cocktail = @cocktail
    @doses.save

    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end


