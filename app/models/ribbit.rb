class Ribbit < ActiveRecord::Base
  default_scope{ order( 'created_at') }
  attr_accessible :content, :user_id
  belongs_to :user

  validates :content, length: { maximum: 140 }
end
