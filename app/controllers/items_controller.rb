class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :cost_id, :sender_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

end
