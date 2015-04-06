class ArticleShow
  run: () ->
    init()
    publish()

  init = () ->
    # $("#article_introduction").redactor()
    # $("#article_body").redactor()

  publish = () ->
    $("#publish_article").on 'click', ->
      confirm("Would you like to publish this Article?") ? true : false

  unpublish = () ->
    $("#unpublish_article").on 'click', ->
      confirm("Would you like to publish this Article?") ? true : false
      



$( ->
  new ArticleShow().run()
)
