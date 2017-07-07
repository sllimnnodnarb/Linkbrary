class LikesController < ApplicationController
  before_action :require_sign_in

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like
    if like.save
      flash[:notice] = "#{@bookmark.url} favorited!"
    else
      flash[:alert] = "Favoriting failed."
    end

    redirect_to [shelf, bookmark]
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "#{@bookmark.url} disliked."
    else
      flash[:alert] = "Disliking failed."
    end
      redirect_to [shelf, bookmark]
  end

end
