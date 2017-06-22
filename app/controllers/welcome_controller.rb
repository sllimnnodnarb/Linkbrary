class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @shelves = Shelf.all
  end

  private

    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    def shelf_params
      params.require(:shelf).permit(:title, :user_id)
    end
end
