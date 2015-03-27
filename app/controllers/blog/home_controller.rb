class Blog::HomeController < ApplicationController
  layout 'blog'

  def home
    @articles = Article.where(status: 'published')
  end

  def show
    @article = Article.find_by(permalink: params[:id])
  end

  def author
    render action: :author, layout: 'personal'
  end

end
