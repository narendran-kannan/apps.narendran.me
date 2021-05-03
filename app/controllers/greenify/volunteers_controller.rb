class Greenify::VolunteersController < ApplicationController
  before_action :set_greenify_volunteer, only: %i[ show edit update destroy ]

  # GET /greenify/volunteers or /greenify/volunteers.json
  def index
    @greenify_volunteers = Greenify::Volunteer.all
  end

  # GET /greenify/volunteers/1 or /greenify/volunteers/1.json
  def show
  end

  # GET /greenify/volunteers/new
  def new
    @greenify_volunteer = Greenify::Volunteer.new
  end

  # GET /greenify/volunteers/1/edit
  def edit
  end

  # POST /greenify/volunteers or /greenify/volunteers.json
  def create
    @greenify_volunteer = Greenify::Volunteer.new(greenify_volunteer_params)

    respond_to do |format|
      if @greenify_volunteer.save
        format.html { render :'greenify/volunteers/thankyou', notice: 'Thank you for your interest. Will get back to you soon!.' }
        format.json { render :show, status: :created, location: @greenify_volunteer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @greenify_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  def thankyou

  end

  # PATCH/PUT /greenify/volunteers/1 or /greenify/volunteers/1.json
  def update
    respond_to do |format|
      if @greenify_volunteer.update(greenify_volunteer_params)
        format.html { redirect_to @greenify_volunteer, notice: 'Volunteer was successfully updated.' }
        format.json { render :show, status: :ok, location: @greenify_volunteer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @greenify_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greenify/volunteers/1 or /greenify/volunteers/1.json
  def destroy
    @greenify_volunteer.destroy
    respond_to do |format|
      format.html { redirect_to greenify_volunteers_url, notice: 'Volunteer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_greenify_volunteer
    @greenify_volunteer = Greenify::Volunteer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def greenify_volunteer_params
    params.require(:greenify_volunteer).permit(:name, :mobile, :mcode, :mail, :status)
  end
end
