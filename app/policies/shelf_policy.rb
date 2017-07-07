class ShelfPolicy < ApplicationPolicy

  def update?
    user.present? && user.admin?
  end


  def destroy?
    user.present? && user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
