class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]

    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
            flash[:error] = @recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    def edit
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            flash[:error] = @recipe.error.full_messages
            redirect_to new_recipe_path
        end
    end

    def destroy
        @recipe.destroy
        redirect_to recipes_path
    end

    private

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :img_url, :user_id)
    end

end
