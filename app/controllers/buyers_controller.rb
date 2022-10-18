class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :sold_item, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end
  
  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_5ae5c5681b632d9bb65e697e"
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def sold_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buyer.nil?
    else
      redirect_to root_path
    end
  end
end
