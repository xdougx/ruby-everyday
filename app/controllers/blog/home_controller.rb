class Blog::HomeController < ApplicationController
  layout 'blog'

  def home
    @articles = Article.published.paginate(page: page)
  end

  def show
    @article = Article.find_by(permalink: params[:id])
    @keep_read = Category.read_more(@article)
  end

  def author
    render action: :author, layout: 'personal'
  end

  private

  def page
    params.key?(:page) ? params[:page].to_i : 1
  end

end
