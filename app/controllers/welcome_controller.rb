class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @shelves = Shelf.all
    @user = current_user
  end
end
