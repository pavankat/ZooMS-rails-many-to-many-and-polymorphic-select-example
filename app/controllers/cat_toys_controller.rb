class CatToysController < ApplicationController
  before_action :set_cat_toy, only: [:show, :edit, :update, :destroy]
  before_action :set_collection, only: [:new, :edit]

  # GET /cat_toys
  # GET /cat_toys.json
  def index
    @cat_toys = CatToy.all
  end

  # GET /cat_toys/1
  # GET /cat_toys/1.json
  def show
  end

  # GET /cat_toys/new
  def new
    @cat_toy = CatToy.new
    @selected = nil
  end

  # GET /cat_toys/1/edit
  def edit
    @selected = "#{@cat_toy.toyable.class}:#{@cat_toy.toyable.id}"
  end

  # POST /cat_toys
  # POST /cat_toys.json
  def create
    @cat_toy = CatToy.new(format_it)

    respond_to do |format|
      if @cat_toy.save
        format.html { redirect_to @cat_toy, notice: 'Cat toy was successfully created.' }
        format.json { render :show, status: :created, location: @cat_toy }
      else
        format.html { render :new }
        format.json { render json: @cat_toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cat_toys/1
  # PATCH/PUT /cat_toys/1.json
  def update
    respond_to do |format|
      if @cat_toy.update(format_it)
        format.html { redirect_to @cat_toy, notice: 'Cat toy was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_toy }
      else
        format.html { render :edit }
        format.json { render json: @cat_toy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cat_toys/1
  # DELETE /cat_toys/1.json
  def destroy
    @cat_toy.destroy
    respond_to do |format|
      format.html { redirect_to cat_toys_url, notice: 'Cat toy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_toy
      @cat_toy = CatToy.find(params[:id])
    end

    def set_collection
      @cat_collection = Lion.all.map {|x| [x.name, "Lion:#{x.id}"]} + Panther.all.map {|x| [x.name, "Panther:#{x.id}"]}
    end








    def format_it
      saveThis = cat_toy_params #this puts the hash returned from cat_toy_params into saveThis

      t = saveThis.delete(:toyable) #this puts toyable into t and deletes it from saveThis

      toyableValues = t.split(":") #split up the value from the form - Lion:1 would be ['Lion', 1]

      saveThis[:toyable_type] = toyableValues[0] #save Lion into toyable_type
      saveThis[:toyable_id] = toyableValues[1] #save 1 into toyable_id

      #return saveThis
      saveThis
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_toy_params
      params.require(:cat_toy).permit(:name, :toyable)
    end
end
