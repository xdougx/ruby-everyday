class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subject
  field :introduction
  field :body
  field :permalink
  field :status
  field :cover
  field :published_in
  field :tags, type: Array

  mount_uploader :cover, CoverUploader

  belongs_to :category
  belongs_to :user

  validates :subject, :introduction, :body, presence: true
  validate :has_one_tag

  before_create :init
  after_create :build_permalink

  def self.build params
    params[:tags] = params[:tags].split(", ")
    article = new params
    article.cover = params[:cover]

    if article.valid?
      article.save
      article
    else
      raise Exceptions::Model.build(article)
    end
  end

  def self.published
    where(status: 'published')
  end

  def build_update params
    params[:tags] = params[:tags].split(", ")
    self.cover = params[:cover] if params.key?(:cover)
    self.update_attributes(params)

    if self.valid?
      self
    else
      raise Exceptions::Model.build(self)
    end
  end

  def init
    self.status = 'draft'
  end

  def build_permalink
    self.update_attributes(permalink: "#{self.subject.parameterize}")
  end

  def publish!
    self.update_attributes(published_in: Time.now, status: 'published')
  end

  def unpublish!
    self.update_attributes(published_in: nil, status: 'draft')
  end

  def has_one_tag
    self.errors.add(:tags, "Must have at least one tag") unless self.tags.size > 1
  end

  def update params
    self.update_attributes(params)
    Excetions::Model.build(article) unless self.valid?
  end

  def draft?
    self.status =~ /draft/
  end

  def to_url
    "#{self.category.url}/#{self.permalink}"
  end
  
end