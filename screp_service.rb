require_relative 'recipe'
require 'open-uri'
require 'nokogiri'
require 'pry'

class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.allrecipes.com/search/?wt=#{@keyword}"
    page = open(url).read
    doc = Nokogiri::HTML(page)
    doc.search('.fixed-recipe-card__info').take(5).map do |web_recipe|
      name = web_recipe.search('.fixed-recipe-card__h3').text.strip
      description = web_recipe.search('.fixed-recipe-card__description').text.strip
      rating = web_recipe.search('.fixed-recipe-card__ratings .stars').attribute('data-ratingstars').value
      urls = web_recipe.search('.fixed-recipe-card__title-link').attribute('href').value
      time = prep_time(urls)
      Recipe.new(name, description, rating, time)
    end
  end

  def prep_time(urls)
    page = open(urls).read
    doc = Nokogiri::HTML(page)
    doc.search('.recipe-meta-item-body').first.text.strip
  end
end
