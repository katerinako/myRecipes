class IngrediantsController < ApplicationController
  before_action :require_user, except: [:show]
  
  def new
    @ingrediant= Ingrediant.new
  end
  
  def create
    @ingrediant=Ingrediant.new(ing_params)
    if @ingrediant.save
      flash[:success] = "Ingrediant was created successfully"
      redirect_to recipes_path
    else
      render 'new'
    end
    
  end
  
  def show
    @ingrediant= Ingrediant.find(params[:id])
    @recipes = @ingrediant.recipes.paginate(page: params[:page], per_page: 4)
  end
  
  private
  
    def ing_params
      params.require(:ingrediant).permit(:name)
    end
  
end