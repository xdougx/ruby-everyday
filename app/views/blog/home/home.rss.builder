xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @title
    xml.description "The Ruby-Everyday is a blog that contans articles, papers, posts about programing with ruby language, javascript and HTML"
    xml.link "http://ruby-everyday.ninja/"

    @articles.each do |article|
      xml.item do
        xml.subject article.title
        xml.description article.introduction
        xml.pubDate article.published_in.to_s(:rfc822)
        xml.link article.to_full_url
        xml.guid article.to_full_url
      end
    end
  end
end