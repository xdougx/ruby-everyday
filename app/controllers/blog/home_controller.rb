class Blog::HomeController < ApplicationController
  layout 'blog'

  def home
    @title = "Ruby Everyday"
    @articles = Article.published.paginate(page: page)

    respond_to do |format|
      format.html
      format.rss { redirect_to feed_path(format: :rss), :status => :moved_permanently }
    end
  end

  def feed
    @title = "Ruby Everyday"
    @articles = Article.published.paginate(page: page)

    respond_to do |format|
      format.rss { render(layout: false) }
    end
  end

  def show
    @article = Article.find_by(permalink: params[:id])
    @title = "#{@article.subject} - Ruby Everyday"
    @keep_read = Category.read_more(@article)
  end

  def author
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
