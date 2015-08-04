class LionTamersController < ApplicationController
  before_action :set_lion_tamer, only: [:show, :edit, :update, :destroy]

  before_action :set_lions, only: [:new, :edit, :create, :update]

  before_action :fix_params, only: [:create, :update]

  # GET /lion_tamers
  # GET /lion_tamers.json
  def index
    @lion_tamers = LionTamer.all
  end

  # GET /lion_tamers/1
  # GET /lion_tamers/1.json
  def show
  end

  # GET /lion_tamers/new
  def new
    @lion_tamer = LionTamer.new
  end

  # GET /lion_tamers/1/edit
  def edit
  end

  # POST /lion_tamers
  # POST /lion_tamers.json
  def create
    @lion_tamer = LionTamer.new(lion_tamer_params)

    respond_to do |format|
      if @lion_tamer.save
        format.html { redirect_to @lion_tamer, notice: 'Lion tamer was successfully created.' }
        format.json { render :show, status: :created, location: @lion_tamer }
      else
        format.html { render :new }
        format.json { render json: @lion_tamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lion_tamers/1
  # PATCH/PUT /lion_tamers/1.json
  def update
    respond_to do |format|
      if @lion_tamer.update(lion_tamer_params)
        format.html { redirect_to @lion_tamer, notice: 'Lion tamer was successfully updated.' }
        format.json { render :show, status: :ok, location: @lion_tamer }
      else
        format.html { render :edit }
        format.json { render json: @lion_tamer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lion_tamers/1
  # DELETE /lion_tamers/1.json
  def destroy
    @lion_tamer.destroy
    respond_to do |format|
      format.html { redirect_to lion_tamers_url, notice: 'Lion tamer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lion_tamer
      @lion_tamer = LionTamer.find(params[:id])
    end

    def set_lions
      @lions = Lion.all
    end

    def fix_params
      params[:lion_tamer][:lion_ids].delete("")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lion_tamer_params
      params.require(:lion_tamer).permit(:name, :experience, :living, :lion_ids => [])
    end
end
