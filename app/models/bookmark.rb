class Bookmark < ActiveRecord::Base
  belongs_to :shelf, dependent: :destroy
  belongs_to :user, dependent: :destroy
  default_scope { order('created_at DESC') }
end
