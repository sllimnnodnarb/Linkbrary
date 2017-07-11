class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def create
    @user = User.find_by(email: params[:sender])
    if @user
      @shelf = Shelf.find_or_create_by(title: params[:subject])
      @url = params["stripped-text"]

      @bookmark = @shelf.bookmarks.find_or_create_by(url: @url)

      head 200
    else
      head 404
    end
  end
end
