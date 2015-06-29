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
      # flash[:notice] = "Success! Go ahead and add a couple of #{@category.category_name}"
    else
      # flash[:error] = 'Category unsuccessfully created'
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id] )
    unless @category
flash[:error] = 'Category not found'
    end
  end

  def category_params
    params.require(:category).permit(:category_name, :general_img)
  end

end
