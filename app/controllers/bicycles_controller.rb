class BicyclesController < ApplicationController
  def index
    if params[:location].present?
      # search_term = params[:location]
      @bicycles = Bicycle.search_by_location(params[:location])

      if params[:size].present?
        @bicycles = @bicycles.search_by_size(params[:size])
      elsif params[:style].present?
        @bicycles = @bicycles.search_by_style(params[:style])
      elsif params[:price].present?
        @bicycles = @bicycles.search_by_price(params[:price])
      end

    else
      @bicycles = Bicycle.where.not(user: current_user) # show bicycles user doesnt own
    end
    @markers = @bicycles.geocoded.map do |bicycle|
      {
        lat: bicycle.latitude,
        lng: bicycle.longitude
      }
    end
  end

  def new
    @bicycle = Bicycle.new
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    @bicycle.user = current_user
    if @bicycle.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @bicycle = Bicycle.find(params[:id])
    @markers = [
      {
        lat: @bicycle.latitude,
        lng: @bicycle.longitude
      }
    ]
  end

  def destroy
    @bicycle = Bicycle.find(params[:id])
    @bicycle.destroy

    redirect_to dashboard_path
  end

  def edit
    @bicycle = Bicycle.find(params[:id])
  end

  def update
    @bicycle = Bicycle.find(params[:id])
    @bicycle.update(bicycle_params)
    redirect_to bicycle_path(@bicycle)
  end


  private

  def bicycle_params
    params.require(:bicycle).permit(:location, :style, :price, :size, :title, :photo)
  end

end
