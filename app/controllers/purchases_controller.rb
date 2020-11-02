class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  def index
    
      if current_user == @item.user || @item.purchase != nil
        redirect_to root_path
      else
        @user_purchase = UserPurchase.new
      end
    
  end
  
  def create
    @user_purchase = UserPurchase.new(purchase_params)
    
     if @user_purchase.valid?
       pay_item
       @user_purchase.save
       return redirect_to root_path
     else
       render 'index'
     end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:post_code, :prefectures_id, :city, :block_number, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
