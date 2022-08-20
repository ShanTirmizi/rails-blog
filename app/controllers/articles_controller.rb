# create a articles controller 
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end 
end 