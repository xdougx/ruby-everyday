class Backoffice::CategoriesController < ApplicationController
  layout 'backoffice'

  def index
    @categories = Category.all
  end

  def new
  end

  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    begin
      Category.build(category_params)
      redirect_to backoffice_categories_path
    rescue => exception
      @error = exception.error
      respond_to do |format|
        format.html { render action: :new }
      end
    end
  end

  def update
    begin
      @category = Category.find(params[:id])
      @category.build_update(category_params)
      redirect_to backoffice_categories_path
    rescue => exception
      @error = exception.error
      respond_to do |format|
        format.html { render action: :show }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :url)
  end

end
