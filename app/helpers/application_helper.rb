module ApplicationHelper
  def select_category
    select_tag "article[category_id]", category_options, class: "form-control"
  end

  def category_options
    options_for_select Category.all.asc("title").map {|c| [c.title, c.id.to_s] }
  end

end
