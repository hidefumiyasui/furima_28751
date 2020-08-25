class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image_url, :name, :explanation, :categorie_id, :condition_id, :shipping_charge_id, :shipping_region_id, :delivery_days_id, :price,).merge(user_id: current_user.id)
  end
end
