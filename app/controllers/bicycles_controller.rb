class BicyclesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
     @bicycle = Bicycle.find(params[:id])
    @bicycle.destroy

    redirect_to bicycles_path
  end

end
