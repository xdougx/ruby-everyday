class Blog::HomeController < ApplicationController
  layout 'blog'

  def home
    @title = "Ruby Everyday"
    @articles = Article.published.paginate(page: page)
  end

  def show
    @article = Article.find_by(permalink: params[:id])
    @title = "#{@article.subject} - Ruby Everyday"
    @keep_read = Category.read_more(@article)
  end

  def author
    @title = "About the Author - Ruby Everyday"
    render action: :author, layout: 'personal'
  end

  def category
    @category = Category.find_by(url: params[:category])
    @title = "#{@category.title} - Ruby Everyday"
    @articles = @category.articles.published
  end

  private

  def page
    params.key?(:page) ? params[:page].to_i : 1
  end

end
