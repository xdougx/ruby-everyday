class Backoffice::ArticlesController < ApplicationController 
  layout 'backoffice'

  def index
    @articles = Article.all
  end

  def new
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    begin
      Article.build(article_params)
      redirect_to backoffice_articles_path
    rescue => exception
      @error = exception.error
      respond_to do |format|
        format.html { render action: :new }
      end
    end
  end

  def publish
    @article = Article.find(params[:id])
    @article.publish!
    redirect_to backoffice_articles_path
  end

  def unpublish
    @article = Article.find(params[:id])
    @article.unpublish!
    redirect_to backoffice_articles_path
  end


  def update
    begin
      @article = Article.find(params[:id])
      @article.build_update(article_params)
    rescue => exceptions
      @error = exceptions.error
    ensure
      respond_to do |format|
        format.html { render action: :show }
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:subject, :introduction, :body, :permalink, :status, :cover, :published_in, :tags, :category_id)
  end
end

