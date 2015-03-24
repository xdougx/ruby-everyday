require 'bcrypt'
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  attr_accessor :frase

  field :name
  field :email
  field :token
  field :resume
  field :pass_frase
  field :status

  validates :name, :email, :token, :frase, presence: true
  validate :frase_presence


  def self.build params
    user = new params
    user.init

    if user.valid?
      user.save
      user
    else
      raise Excetions::Model.build(user)
    end
  end

  def init
    self.status = "active"
    self.token = SecureRandom.hex(16)
  end

  def frase
    @frase ||= Password.new(self.pass_frase) if self.pass_frase
  end

  def frase=(new_frase)
    @frase = Password.create(new_frase)
    self.pass_frase = @frase
  end

  def frase_presence
    self.errors.add :frase, I18n.t("errors.messages.blank") unless @frase.present?
  end

end