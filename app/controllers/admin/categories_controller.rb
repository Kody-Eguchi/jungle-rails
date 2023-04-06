class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id).all
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :id
    )
  end
end
