class User < ActiveRecord::Base

  attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
  has_secure_password
  has_many :ribbits

  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :followed_relationships, class_name: 'Relationship', foreign_key: 'follower_id'

  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships

  before_validation :prep_email
  before_save :create_avatar_url
  #before_create

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def following? user
    self.followeds.include? user
  end
  def follow user
    Relationship.create follower_id: self.id, followed_id: user.id
  end

  def user_params
    params.require(:user).permit(:email, :username, :name, :password, :password_confirmation, :commit)
  end
  private
  def prep_email
  	self.email = self.email.strip.downcase if self.email
  end

  def create_avatar_url
  	self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
  end

end