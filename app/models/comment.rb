class Comment < ApplicationRecord
  before_save :titleDowncase

  validates :title, presence: true
  validates :content, presence: true
  validates :post_id, presence: true


  belongs_to :post

  def titleDowncase
    self.title = self.title.downcase
  end
end
