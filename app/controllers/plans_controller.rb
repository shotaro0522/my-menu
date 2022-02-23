class PlansController < ApplicationController
  def create
    Plan.create(plan_params)
    redirect_to  controller: :users, action: :show, id: current_user.id
  end

  def destroy
    Plan.where(week_id: 0..6).delete_all
    redirect_to  controller: :users, action: :show, id: current_user.id
  end

  private
  def plan_params
    params.require(:plan).permit(:week_id, :recipe_number)
  end


end
