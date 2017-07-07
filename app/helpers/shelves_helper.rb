module ShelvesHelper
  def user_is_authorized_for_shelves?(shelf)
    current_user && (current_user.admin? || shelf.user_id?)
  end
end
