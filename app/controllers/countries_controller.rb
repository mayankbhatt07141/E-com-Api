class CountriesController < ApplicationController
  def index
    countries=Country.all
    if countries
      render json: {data: countries}
    else
      render json: {error: "error while fetching the Country"}
    end
  end
end
