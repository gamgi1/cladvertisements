class CategoriesController < ApplicationController
  before_action :find_category, only: (:show, :edit, :update, :destroy)

  end

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
    @category = Category.create(category_params)
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
    params.require(:category).permit(:type)
  end

end
