class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find(params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = Plant.find(params[:id])
    if plant
    plant.update(is_in_stock: params[:is_in_stock])
    render json: plant, status: :ok
    else
      render json: {error: "Plant not found"}, status: :not_found
    end
  end

  def destroy
    plant = Plant.find(params[:id])
    if plant
      plant.destroy
      head :no_content
    else
      render json: {error: "Plant not found"}, status: :not_found
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
