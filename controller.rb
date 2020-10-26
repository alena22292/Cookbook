require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'recipe'
require_relative 'view'
require_relative 'screp_service'


class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    name = @view.ask_recipe_name
    description = @view.ask_recipe_description
    rate = @view.ask_recipe_rating
    prep_time = @view.ask_recipe_prep_time
    recipe = Recipe.new(name, description, rate, prep_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    index = @view.ask_for_index
    @cookbook.remove_recipe(index)
  end

  def import
    ingredient = @view.ask_for_ingredient
    puts "Looking for '#{ingredient}' recipes on the Internet..."
    recipes = ScrapeAllrecipesService.new(ingredient).call
    index = @view.ask_index_to_import(recipes)
    puts "Importing '#{recipes[index].name}'..."
    @cookbook.add_recipe(recipes[index])
  end

  def mark_as_done
    list
    index = @view.ask_for_index
    recipe = @cookbook.find(index)
    recipe.mark_as_done!
  end
end
