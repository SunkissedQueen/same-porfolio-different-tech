class ChickensController < ApplicationController
  def index
    chickens = Chicken.all
    render json: chickens
  end

  def create
    chicken = Chicken.create(chicken_params)
    render json: chicken
  end

  def update
    
  end

  def destroy
  end

  private
  def chicken_params
    params.require(:chicken).permit(:name, :age, :hobbies, :image)
  end
end
