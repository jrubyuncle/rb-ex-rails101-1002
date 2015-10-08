class Post < ActiveRecord::Base
  belongs_to :group, counter_cache: :posts_count
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  validates :content, presence: true

  scope :recent, -> { order("updated_at DESC") }

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
