class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
       redirect_to cocktail_path(@cocktail)
         else
          render :new
         end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktails_path
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, )
  end

end
