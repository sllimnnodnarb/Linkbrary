class BookmarksController < ApplicationController
  before_action :set_bookmark, except: [:index, :new, :create]
  before_action :set_shelf
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])

  end

  def create
    @bookmark = @shelf.bookmarks.new(bookmark_params)
    #@bookmark.user = current_user

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @shelf, notice: 'Bookmark was successfully created.' }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bookmark.assign_attributes(bookmark_params)

    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to [@shelf, @bookmark], notice: 'Bookmark was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @shelf, notice: 'Bookmark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def set_shelf
      @shelf = Shelf.find(params[:shelf_id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:url, :shelf_id)
    end

    def shelf_params
      params.require(:shelf).permit(:title, :user_id)
    end
end
