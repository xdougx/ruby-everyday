#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.author "Douglas Rossignolli"
    xml.title @title
    xml.description "The Ruby-Everyday is a blog that contans articles, papers, posts about programing with ruby language, javascript and HTML"
    xml.link "http://ruby-everyday.ninja/"
    xml.language "en"

    for article in @articles
      xml.item do
        xml.title article.subject
        xml.author article.user.name
        xml.pubDate article.published_in.to_s(:rfc822)
        xml.link article.to_full_url
        xml.guid article.id
        xml.description(article.introduction + article.body)
      end
    end
  end
end