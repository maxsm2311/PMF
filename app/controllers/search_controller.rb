class SearchController < ApplicationController
  def search
    @search_term = params[:search_term]
    @categories = Category.where("name LIKE ?", "%#{@search_term}%")
    @operations = Operation.where("description LIKE ?", "%#{@search_term}%")
  end
end
