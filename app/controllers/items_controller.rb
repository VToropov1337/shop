class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)

  end
end
