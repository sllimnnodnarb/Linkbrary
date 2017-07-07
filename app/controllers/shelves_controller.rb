class ShelvesController < ApplicationController
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  skip_before_action :authenticate_user!
  after_action :verify_authorized, only: [:destroy, :update]

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
    @shelf.user = current_user
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

    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    def shelf_params
      params.require(:shelf).permit(:title, :user_id)
    end

    def authorize_user
     unless current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to shelves_path
     end
   end

   def authorize_moderator
     unless current_user.moderator?
       flash[:alert] = "You must be an admin to do that."
       redirect_to shelves_path
     end
   end

   def authorized_for_create
     unless current_user
       flash[:alert] = "You must be an admin to do that."
       redirect_to shelves_path
     end
   end

   def authorized_for_update
     unless current_user_id == shelf.user_id || current_user.admin?
       flash[:alert] = "You must be at least a moderator to do that."
       redirect_to shelves_path
     end
   end
end
