class CategoriesController < ApplicationController
  def index
    categories=Category.all
    if categories
      render json: {data: categories}
    else
      render json: {error: "error while fetching the category"}
    end
  end
end
