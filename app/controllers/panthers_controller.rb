class PanthersController < ApplicationController
  before_action :set_panther, only: [:show, :edit, :update, :destroy]

  # GET /panthers
  # GET /panthers.json
  def index
    @panthers = Panther.all
  end

  # GET /panthers/1
  # GET /panthers/1.json
  def show
  end

  # GET /panthers/new
  def new
    @panther = Panther.new
  end

  # GET /panthers/1/edit
  def edit
  end

  # POST /panthers
  # POST /panthers.json
  def create
    @panther = Panther.new(panther_params)

    respond_to do |format|
      if @panther.save
        format.html { redirect_to @panther, notice: 'Panther was successfully created.' }
        format.json { render :show, status: :created, location: @panther }
      else
        format.html { render :new }
        format.json { render json: @panther.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /panthers/1
  # PATCH/PUT /panthers/1.json
  def update
    respond_to do |format|
      if @panther.update(panther_params)
        format.html { redirect_to @panther, notice: 'Panther was successfully updated.' }
        format.json { render :show, status: :ok, location: @panther }
      else
        format.html { render :edit }
        format.json { render json: @panther.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panthers/1
  # DELETE /panthers/1.json
  def destroy
    @panther.destroy
    respond_to do |format|
      format.html { redirect_to panthers_url, notice: 'Panther was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panther
      @panther = Panther.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panther_params
      params.require(:panther).permit(:name, :claw_length)
    end
end
