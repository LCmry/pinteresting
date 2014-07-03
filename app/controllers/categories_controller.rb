class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @categories = Pin.order("created_at DESC").paginate(:page => params[:page], :per_page => 50)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(c_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    def c_params
      params.require(:category).permit(:name, :pins)
    end
end
