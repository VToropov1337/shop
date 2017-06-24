class ItemsController < ApplicationController
  before_action :find_items, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    #@item = Item.new
    @item = current_user.items.build

  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: "Successfully created new Bid"
    else
      render 'new'
    end
  end

  def edit
  #  @item = Item.find(params[:id])
  end

  def update
    if  @item.update(item_params)
        redirect_to @item, notice: "Bid was successfully updated!"
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
