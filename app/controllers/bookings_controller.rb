class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    set_booking
  end

  def new
    @place = Place.find(params[:place_id])
    @user = current_user
    @booking = Booking.new
  end

  # GET
  def edit
    set_booking
  end

  def create
    @place = Place.find(params[:place_id])
    @booking = Booking.new(booking_params)
    @booking.place = @place
    @booking.user = current_user


    if @booking.save!
      redirect_to root_path, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end

  end

  # PATCH/PUT
  def update
    set_booking
    if @booking.update(booking_params)
      redirect_to booking_url(@booking), notice: "This Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity # Indica el error en el formulario y hace un renderizado
    end
  end

  # DELETE
  def destroy
    set_booking
    @booking.destroy
    redirect_to bookings_url, notice: "This Booking was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
