class WbCanvasController < ApplicationController
  before_action :set_wb_canva, only: %i[ show edit update destroy ]

  # GET /wb_canvas or /wb_canvas.json
  def index
    @wb_canvas = WbCanva.all
  end

  # GET /wb_canvas/1 or /wb_canvas/1.json
  def show
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found unless @canvas
  end

  # GET /wb_canvas/new
  def new
    @wb_canva = WbCanva.new
  end

  # GET /wb_canvas/1/edit
  def edit
  end

  # POST /wb_canvas or /wb_canvas.json
  def create
    @wb_canva = WbCanva.new
    respond_to do |format|
      begin
        @wb_canva.save
        format.html { redirect_to @wb_canva, notice: 'Wb canva was successfully created.' }
        format.json { render :show, status: :created, location: @wb_canva }
      rescue ActiveModel::ValidationError
        retry
      end
    end
  end

  # PATCH/PUT /wb_canvas/1 or /wb_canvas/1.json
  def update
    respond_to do |format|
      if @wb_canva.update(wb_canva_params)
        format.html { redirect_to @wb_canva, notice: 'Wb canva was successfully updated.' }
        format.json { render :show, status: :ok, location: @wb_canva }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wb_canva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wb_canvas/1 or /wb_canvas/1.json
  def destroy
    @wb_canva.destroy
    respond_to do |format|
      format.html { redirect_to wb_canvas_url, notice: 'Wb canva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_wb_canva
    @canvas = WbCanva.find_by(name: params[:name])
  end

  # Only allow a list of trusted parameters through.
  def wb_canva_params
    params.require(:wb_canva).permit(:name, :img_data)
  end
end
