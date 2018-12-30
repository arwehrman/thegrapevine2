class WinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @wines = Wine.paginate(page: params[:page], per_page: 6)
  end

  def mywines
    @wines = current_user.wines.paginate(page: params[:page], per_page: 6)
  end

  def new
    @wine = current_user.wines.build
  end

  def create
    @wine = current_user.wines.build(wine_params)
    if @wine.save
      redirect_to wines_path
    else
      render :new
    end
  end

  def edit
    @wine = Wine.find_by(params[:id])
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update_attributes(wine_params)
      redirect_to @wine
    else
      render :edits
    end
  end

  def destroy
    @wine = current_user.wines.fine(params[:id])
    @wine.destroy
    redirect_to wines_path(current_user)
  end

  private
  def wine_params
    params.require(:wine).permit(:id, :maker, :wine_type, :vintage, :region, :price, :rating, :user_id)
  end
end
