class Group < ActiveRecord::Base
  validates :title, presence: true

  has_many :posts, dependant: :destroy
  #belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :group_users
  has_many :members, through: :group_users, source: :user
  def editable_by?(user)
    #return true
    user && user == owner
  end
end
