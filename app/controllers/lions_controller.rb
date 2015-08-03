class LionsController < ApplicationController
  before_action :set_lion, only: [:show, :edit, :update, :destroy]

  # GET /lions
  # GET /lions.json
  def index
    @lions = Lion.all
  end

  # GET /lions/1
  # GET /lions/1.json
  def show
  end

  # GET /lions/new
  def new
    @lion = Lion.new
  end

  # GET /lions/1/edit
  def edit
  end

  # POST /lions
  # POST /lions.json
  def create
    @lion = Lion.new(lion_params)

    respond_to do |format|
      if @lion.save
        format.html { redirect_to @lion, notice: 'Lion was successfully created.' }
        format.json { render :show, status: :created, location: @lion }
      else
        format.html { render :new }
        format.json { render json: @lion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lions/1
  # PATCH/PUT /lions/1.json
  def update
    respond_to do |format|
      if @lion.update(lion_params)
        format.html { redirect_to @lion, notice: 'Lion was successfully updated.' }
        format.json { render :show, status: :ok, location: @lion }
      else
        format.html { render :edit }
        format.json { render json: @lion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lions/1
  # DELETE /lions/1.json
  def destroy
    @lion.destroy
    respond_to do |format|
      format.html { redirect_to lions_url, notice: 'Lion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lion
      @lion = Lion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lion_params
      params.require(:lion).permit(:birthdate, :name, :about, :weight, :health, :health_notes)
    end
end
