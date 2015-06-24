class CategoriesController < ApplicationController
  before_action :find_category, only:[:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end

  def create
    @category = Category.new
    if @category.save(category_params)
      redirect_to category_items_path(@category.id)
    else
      flash[:error] = 'Category unsuccessfully created'
      render :new
    end
  end

  def update
    @category.update(category_params)
  end

  def destroy
    @category.destroy
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id] )
  end

  def category_params
    params.require(:category).permit(:category_name)
  end

end
