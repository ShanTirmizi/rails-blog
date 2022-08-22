class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to @article
    else
      render "edit"
    end
  end

  # def destroy
  #
  #   @article.destroy
  #   redirect_to articles_path
  # end
  def destroy
    @article.destroy

    respond_to do |format|
      format.html do
        redirect_to articles_url, notice: "Article was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
