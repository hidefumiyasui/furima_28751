class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :move_to_root
  before_action :set_order, only: [:index, :create]
  before_action :set_item_order, only: [:index, :create]

  def index
  end

  def create
    if @order.valid?
      @order.save
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :authenticity_token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @order.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def set_item_order
    @order = ItemOrder.new(order_params)
  end
end
