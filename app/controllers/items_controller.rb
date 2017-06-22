class ItemsController < ApplicationController
  before_action :find_items, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
    redirect_to @item
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if  @item.update(item_params)
        redirect_to @item
    else
      render 'edit'
    end

  end

  def destroy
    @item.destroy
      redirect root_path
  end

  private

  def find_items
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :image)

  end
end
