class Post < ActiveRecord::Base
  attr_accessible :content

  
  belongs_to :user

  
  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  default_scope :order => 'posts.created_at DESC'
  
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  # searchable do
  #  text :content
  # end
  
  
      
  private
  
    def self.followed_by(user)
      followed_ids = %(SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id)
      
      where("user_id IN (#{followed_ids}) OR user_id = :user_id",
            :user_id => user)
            
      
    end
end





# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  repost     :string(255)
#

