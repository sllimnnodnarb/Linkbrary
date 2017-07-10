class LikesController < ApplicationController
  before_action :find_bookmark, except: [:index]

  def index
    @likes = current_user.likes.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: @bookmark.id)
    authorize like

    if like.save
      flash[:notice] = "#{@bookmark.url} Liked!"
    else
      flash[:alert] = "Like failed."
    end
    redirect_to shelf_path(@bookmark.shelf)
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "#{@bookmark.url} Unliked."
    else
      flash[:alert] = "Dislike failed."
    end
      redirect_to shelf_path(@bookmark.shelf)
  end

  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

end
