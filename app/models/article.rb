class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subject
  field :introduction
  field :body
  field :permalink
  field :status
  field :tags, type: Array
  field :cover

  validates :subject, :introduction, :body, presence: true
  validate :has_one_tag

  before_create :init
  after_create :build_permalink

  def self.build params
    article = new params

    if article.valid?
      article.save
      article
    else
      raise Excetions::Model.build(article)
    end
  end

  def init
    self.status = 'draft'
  end

  def build_permalink
    self.update_attributes(permalink: "#{self.id}-#{self.subject.parameterize}")
  end

  def has_one_tag
    self.errors.add(:tags, "Must have at least one tag") unless self.tags.size > 1
  end

  def update params
    self.update_attributes(params)
    Excetions::Model.build(article) unless self.valid?
  end
end