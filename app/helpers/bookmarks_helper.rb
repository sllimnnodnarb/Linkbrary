module BookmarksHelper
  def user_is_authorized_for_bookmarks?(shelf, bookmark)
    current_user && (current_user.admin? || shelf.user_id?)
  end
end
