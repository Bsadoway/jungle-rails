class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, :dependent => :nullify
  before_save :downcase_fields

  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, uniqueness: { case_sensitive: false }, presence:true
  validates :password, length: { minimum: 8 }, presence:true
  validates :password_confirmation, presence:true

  def self.authenticate_with_credentials( email, password)
    User.find_by(email: email.strip.downcase).try(:authenticate, password)
  end

  def downcase_fields
    self.email.downcase!
  end
end
