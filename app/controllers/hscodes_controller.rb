class HscodesController < ApplicationController
  def index
    hscodes=Hscode.all
      if hscodes
        render json: {data: hscodes}
      else
        render json: {error: "error while fetching the Country"}
      end
  end
end
