class ChickensController < ApplicationController
  def index
    chickens = Chicken.all
    render json: chickens
  end

  def create
  end

  def update
    
  end

  def destroy
  end

end
