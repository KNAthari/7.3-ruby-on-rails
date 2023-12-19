class Article < ApplicationRecord
  include Visible

  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :category, presence: true


  def self.recent_articles(limit = 5)
    order(created_at: :desc).limit(limit)
  end
end
