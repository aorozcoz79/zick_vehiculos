require 'byebug'
class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def new
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    if vehicle_params[:actual_vehicle] === "true"
      @vehicles = Vehicle.where(user_id: vehicle_params[:user_id])
      if !@vehicles.nil?
          @vehicles.each do |v|
            v.update(actual_vehicle: "false")
          end
        end
    end
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to "/vehicles", notice: 'El vehículo fue añadido!' }
        format.json { render :index, status: :created, location: @vehicle }
      else
        format.html { render :index}
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update

    if vehicle_params[:actual_vehicle] === "true"
      @vehicles = Vehicle.where(user_id: vehicle_params[:user_id])

      if !@vehicles.nil?
          @vehicles.each do |v|
            v.update(actual_vehicle: "false")
          end
        end
    end
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicles_url, notice: 'Los datos del vehículo fueron modificados' }
        format.json { render :index, status: :ok, location: @vehicle, notice: 'Los datos del vehículo fueron modificados'}
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'El vehículo seleccionado fue eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:plate, :brand, :model, :string, :doors, :kind, :user_id, :actual_vehicle)
    end
end
