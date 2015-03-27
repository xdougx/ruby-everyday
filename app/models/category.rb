class Category
  include Mongoid::Document
  field :title
  field :url

  has_many :articles

  validates :title, :url, presence: true


  def self.build params
    category = new params

    if category.valid?
      category.save
      category
    else
      raise Exceptions::Model.build(category)
    end
  end

  def build_update params
    self.update_attributes(params)

    if self.valid?
      self
    else
      raise Exceptions::Model.build(self)
    end
  end

  def size
    self.articles.size
  end

end