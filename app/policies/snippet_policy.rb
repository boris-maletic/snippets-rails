class SnippetPolicy < ApplicationPolicy
  def update?
    owner?
  end

  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  private 
  
  def owner?
    user.id == record.user_id
  end
end
