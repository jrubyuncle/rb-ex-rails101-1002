class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  validates :content, presence: true

  def editable_by?(user)
    #return true
    user && user == author
  end

  def show_author_name
    if self.author.nil?
      "no_name"
    else
      self.author.name
    end
  end
end
