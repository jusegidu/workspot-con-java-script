class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    set_place
  end

  def new
    @place = Place.new
  end

  # GET
  def edit
    set_place
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user

    if @place.valid?
      if @place.save
        redirect_to place_url(@place), notice: "Place was successfully created."
      else
        render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
      end
    else
      @place.errors.full_messages
    end
  end

  # PATCH/PUT
  def update
    if @place.update(place_params)
      raise
      redirect_to place_url(@place), notice: "This Place was successfully updated."
    else
      render :edit, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # DELETE
  def destroy
    set_place
    @place.destroy
    redirect_to places_url, notice: "This Place was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_place
    @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:name, :address, :city, :country, :price)
  end
end
