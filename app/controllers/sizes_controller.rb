class SizesController < ApplicationController
   def index
    sizes=Size.all
    if sizes
      render json: {item: sizes}
    else
      render json: {error: "error while fetching the sizes"}, status: 422
    end
  end
end
