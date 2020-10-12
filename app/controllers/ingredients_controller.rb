class IngredientsController < ApplicationController
    before_action :find_ingredient, only: [:edit, :update, :show, :destory]

    def index
        @ingredients = Ingredient.all
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
        if @ingredient.valid?
            flash[:success] = "Ingredient successfully created"
            redirect_to ingredient_path(@ingredient)
        else
            flash[:error] = @ingredient.errors.full_messages
            redirect_to new_ingredient_path
        end
    end

    def edit
        
    end

    def update
        if @ingredient.update(ingredient_params)
            flash[:success] = "Object was successfully updated"
            redirect_to ingredient_path(@ingredient)
        else
            flash[:error] = @ingredient.errors.full_messages
            redirect_to edit_ingredient_path
        end
    end

    def destroy
        
        if @object.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to ingredients_path
        else
            flash[:error] = @object.errors.full_messages
            redirect_to object_path
        end
    end
    
end

private

    def inredient_params
        params.require(:ingredient).permit(:name, :calories)
    end

    def find_ingredient
        @ingredient = Ingredient.find(params[:id])
    end
    