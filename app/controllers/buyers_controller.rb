class BuyersController < ApplicationController
  before_action :sold_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end
  
  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def sold_item
    @item = Item.find(params[:item_id])
    if user_signed_in?
    elsif current_user == @item.user_id || @item.buyer.nil?
      redirect_to root_path
    else @item.user_id || @item.buyer.nil?
      redirect_to root_path
    end
  end
end
