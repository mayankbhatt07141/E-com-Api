class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

## get list of  all the products 
  def index
    @products=AddProduct.all
    render json: {data: @products}
  end

  def create     
    @product=AddProduct.create!(product_params)
    @product.update({cover_image_url: url_for(@product.image)})
    if @product.valid?
      render json: { message: "product created sucessfully", id: @product.id}
    else
      render json: { error: "error occoured while creating the product" }, status: 422
    end
  end
 
  def update
    puts params
    @product=AddProduct.find_by(params[:id])
    @product.image.purge;
    @product.update(product_params)
    @product.update({cover_image_url: url_for(@product.image)})
    if @product.save
      puts "bat done"
      render json: {resp:"updated"}
    else
      puts "error"
      render json:{error: "error"}
    end
  end
   
## get products by id
  def show
    @product=AddProduct.find_by(id: params[:id])
    if @product.present?
      render json: {data: @product}
    else
      puts "afdsk"
      render json:{error: "error"}
    end
   
  end
  
  private 

  def product_params
    params.require(:product).permit(:title,:product_description,:category,:brand_name,:custom,:sleeves,:top_design,:bottom_design,:material,:size,:designer_fee,:material_fee,:manufacture_fee,:total_price,:gomble_service_fee,:amount_receive,:country,:product_id,:hs_code,:image,:tags)
  end
end

