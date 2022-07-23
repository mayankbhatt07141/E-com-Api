class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

## get lst of  all thr products 
  def index
    @products=AddProduct.all
    render json: {all_product: @products}
  end

  def create
    @product=AddProduct.create product_params
    if @product.valid?
      render json: { message: "product created sucessfully", id: @product.id}
    else
      render json: { error: "error occoured while creating the product" }, status: 422
    end
  end
 
  def update
    @product=AddProduct.find_by(params[:id])
    if @product
      @product.update(params)
    end
  end
## get products by id
  def show
    products=AddProduct.all
    render json: {all_product: products}
  end

  
  private 

  def product_params
    # :images[],:title,:product_description,:category,:brand_name,:custom,:tags,:sleeves,:top_design,:bottom_design,:material,:size,:designer_fee,:material_fee,:manufacture_fee,:total_price,:gomble_service_fee,:amount_receive,:country,:product_id,:hs_code
    params.require(:product).permit(:title)
  end
end

