class Article < ApplicationRecord

  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  def number_of_comments
  	self.comments.count
  end

end
