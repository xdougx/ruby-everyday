module ApplicationHelper
  def select_category current_category = nil
    select_tag "article[category_id]", category_options(current_category), class: "form-control", prompt: "Select a Category"
  end

  def category_options current_category = nil
    options_for_select Category.all.asc("title").map {|cat| [cat.title, cat.id.to_s] }, current_category
  end

  def select_lang current_lang = nil
    select_tag "article[lang_id]", lang_options(current_lang), class: "form-control", prompt: "Select a language"
  end

  def lang_options(current_lang = nil)
    options_for_select Lang.all.asc("name").map {|lang| [lang.name, lang.id.to_s] }, current_lang
  end

end
