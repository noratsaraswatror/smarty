class BloodReadingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blood_reading, only: %i[ show]

  # GET /blood_readings or /blood_readings.json
  def index
    @blood_readings = current_user.blood_readings
  end

  # GET /blood_readings/1 or /blood_readings/1.json
  def show
  end

  # GET /blood_readings/new
  def new
    @blood_reading = BloodReading.new
  end

  # # GET /blood_readings/1/edit
  # def edit
  # end

  # POST /blood_readings or /blood_readings.json
  def create
    @blood_reading = current_user.blood_readings.new(blood_reading_params)
    respond_to do |format|
      if @blood_reading.save
        format.html { redirect_to blood_reading_url(@blood_reading), notice: "Blood reading was successfully created." }
        format.json { render :show, status: :created, location: @blood_reading }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blood_reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /blood_readings/1 or /blood_readings/1.json
  # def update
  #   respond_to do |format|
  #     if @blood_reading.update(blood_reading_params)
  #       format.html { redirect_to blood_reading_url(@blood_reading), notice: "Blood reading was successfully updated." }
  #       format.json { render :show, status: :ok, location: @blood_reading }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @blood_reading.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /blood_readings/1 or /blood_readings/1.json
  # def destroy
  #   @blood_reading.destroy

  #   respond_to do |format|
  #     format.html { redirect_to blood_readings_url, notice: "Blood reading was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blood_reading
      @blood_reading = BloodReading.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blood_reading_params
      params.require(:blood_reading).permit(:blood_glucose_level, :user_id)
    end
end
