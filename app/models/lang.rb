class Lang
  include Mongoid::Document

  field :name
  field :symbol

  validates_uniqueness_of :name, :symbol

  has_many :articles
end