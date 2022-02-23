class RefrigeratorsController < ApplicationController
  def create
    Refrigerator.create(stock_params)
    redirect_to  controller: :users, action: :show, id: current_user.id
  end

  def destroy
    Refrigerator.delete_all
    redirect_to  controller: :users, action: :show, id: current_user.id
  end

  private
  def stock_params
    params.require(:refrigerator).permit(:stock)
  end
end
