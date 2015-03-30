(function() {
  var ArticleShow;

  ArticleShow = (function() {
    var init, publish, unpublish;

    function ArticleShow() {}

    ArticleShow.prototype.run = function() {
      init();
      return publish();
    };

    init = function() {
      $("#article_introduction").redactor();
      return $("#article_body").redactor();
    };

    publish = function() {
      return $("#publish_article").on('click', function() {
        var ref;
        return (ref = confirm("Would you like to publish this Article?")) != null ? ref : {
          "true": false
        };
      });
    };

    unpublish = function() {
      return $("#unpublish_article").on('click', function() {
        var ref;
        return (ref = confirm("Would you like to publish this Article?")) != null ? ref : {
          "true": false
        };
      });
    };

    return ArticleShow;

  })();

  $(function() {
    return new ArticleShow().run();
  });

}).call(this);
