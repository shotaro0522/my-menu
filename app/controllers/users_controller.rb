class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    if Recipe.exists?(user_id: current_user.id)
      @recipes = Recipe.where(user_id: current_user.id).order(created_at: "DESC")
    end
  end
end
