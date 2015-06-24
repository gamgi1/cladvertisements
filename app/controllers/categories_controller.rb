class CategoriesController < ApplicationController
  before_action :find_category, only:[ :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
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
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id] )
    unless @category
      render(text: 'Category not found', status: 404)
    end
  end

  def category_params
    params.require(:category).permit(:category_name)
  end

end
