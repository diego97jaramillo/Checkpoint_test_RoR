class Post < ApplicationRecord
  before_validation :allDowncase


  validates :title, presence: true
  validates :content, presence: true
  validates :tag, presence: true
  validates :category, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy


  private

  scope :findByTitle, ->(phrase) { where("title LIKE ?", "%#{phrase.downcase}%") }
  scope :findByTag, ->(phrase) { where("tag LIKE ?", "%#{phrase.downcase}%") }
  scope :findByCategory, ->(phrase) { where("category LIKE ?", "%#{phrase.downcase}%") }

  def allDowncase
    self.title = self.title.downcase
    self.tag = self.tag.downcase
    self.category = self.category.downcase
  end
end
