class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 8)
    authorize @articles
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      flash[:notice] = "Article was successfully saved."
      redirect_to @article
    else
      flash[:error] = "There was an error saving the article. Please try again."
      render :new
    end
  end

  def update
    @article = current_user.articles.find(params[:id])
    authorize @article
    if @article.update_attributes(article_params)
      flash[:notice] = "Article was successfully updated."
      redirect_to @article
    else
      flash[:error] = "There was an error updating the article. Please try again."
      render :edit
    end
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    authorize @article
    if @article.destroy
      flash[:notice] = "The article was successfully deleted."
      redirect_to articles_path
    else
      flash[:error] = "There was an error deleting the article. Please try again."
      render :show
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
