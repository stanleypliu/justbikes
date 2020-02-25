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

  def show
    @bicycle = Bicycle.find(params[:id])
  end

  def destroy
     @bicycle = Bicycle.find(params[:id])
    @bicycle.destroy

    redirect_to bicycles_path
  end

  private

  def bicycle_params
    params.require(:bicycle).permit(:location, :style, :price, :size, :title)
  end
end
