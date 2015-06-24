class ItemsController < ApplicationController
  before_action :find_category
  before_action :find_item, only:[:show, :edit, :update, :destroy]
  def index
    @items = @category.items
  end
  def new
    @item = @category.items.build
  end
  def create
    @item = @category.items.build(item_params)
    if @item.save
      redirect_to category_item_path(@category.id, @item.id)
    else
      flash[:error] = "Item unsuccessfully created"
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @item.update(item_params)
      flash[:notice] = "Item #{@item.name_of_item} successfully updated"
      redirect_to category_item_path(@category.id, @item.id)
    else
      flash[:error] = "Item could not be updated"
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to category_items_path(@category.id)
  end
  private
  def find_category
    @category = Category.find(params[:category_id])
  end
  def find_item
    @item = @category.items.find_by(id: params[:id])
  end
  def item_params
    params.require(:item).permit(:price, :contact, :city, :quality, :name_of_item, :description, :avatar)
  end
end
