class BicyclesController < ApplicationController
  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    if @bicycle.save
      redirect_to bicycles_path
    else
      render :new
    end
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:location, :style, :price, :size, :title)
  end
end
