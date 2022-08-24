class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def show 
    @category = Category.find(params[:id])
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render :new, status: :not_found
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end