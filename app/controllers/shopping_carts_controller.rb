class ShoppingCartsController < ApplicationController
     skip_before_action :verify_authenticity_token
  def create
    # @product = Product.find(1)
    # @cart.add(@product, @product.price)
     @shopping_cart=ShoppingCart.create
     @product = AddProduct.find_by(id: 3)
     if @product
      @shopping_cart.add(@product, @product.price)
      render json: {response: "item added to cart"}
     else
      render json: {error: "error while adding item to the cart"}
     end
     
  end
  def index 
    @cart=ShoppingCartItem.all
    if @cart
      render json: {response: @cart}
    else
       render json: {error: "error while loading cart items"}
    end
  end
  def destroy
  # delete all the items form cart
    @cart=ShoppingCartItem.find_by(params[:id])
    if @cart.destroy
      render json: {message: "deleted sucessfully"}
    else 
      render json: {error:"Error while deleting"}
    end
        # ShoppingCart.remove(params[:id])
    
  end
end
