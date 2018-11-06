class ContentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

private
  def owner?
    record.project.user == user
  end

end
