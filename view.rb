class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? '[x]' : '[]'
      puts "#{index + 1}. #{done} #{recipe.name}: #{recipe.description}. Rating (#{recipe.rating} / 5)"
    end
  end

  def ask_index_to_import(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}"
    end
    puts 'Which recipe would you like to import? (enter index)'
    p ">"
    gets.chomp.to_i - 1
  end

  def ask_recipe_name
    puts "What recipe name?"
    p ">"
    gets.chomp
  end

  def ask_recipe_description
    puts "What description of the recipe?"
    p ">"
    gets.chomp
  end

  def ask_recipe_rating
    puts "What rating of the recipe?"
    p ">"
    gets.chomp.to_f
  end

  def ask_recipe_prep_time
    puts "What preparation time of the recipe?"
    p ">"
    gets.chomp
  end

  def ask_for_index
    puts "What index do you want to find?"
    p ">"
    gets.chomp.to_i - 1
  end

  def ask_for_ingredient
    puts "What ingredient would you like a recipe for?"
    p ">"
    gets.chomp
  end
end
