class ShelfsController < ApplicationController
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]

  def index
    @shelves = Shelf.all
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def new
    @shelf = Shelf.new
  end

  def edit
  end

  def create
    @shelf = Shelf.new(shelf_params)
    @shelf_carousel = []
    @shelf_carousel << @shelf
    respond_to do |format|
      if @shelf.save
        format.html { redirect_to @shelf, notice: 'Shelf was successfully created.' }
        format.json { render :show, status: :created, location: @shelf }
      else
        format.html { render :new }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shelf.update(shelf_params)
        format.html { redirect_to @shelf, notice: 'Shelf was successfully updated.' }
        format.json { render :show, status: :ok, location: @shelf }
      else
        format.html { render :edit }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shelf.destroy
    respond_to do |format|
      format.html { redirect_to shelves_url, notice: 'Shelf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shelf_params
      #params.fetch(:shelf, {})
      params.require(:shelf).permit(:title, :user_id)
    end
end
