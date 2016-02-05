class Ribbit < ActiveRecord::Base
  default_scope{ order( 'created_at DESC') }
  attr_accessor :content, :user_id
#  attr_accessible :content, :user_id
  belongs_to :user

  validates :content, length: { maximum: 140 }
end
