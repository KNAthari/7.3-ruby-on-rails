class Category < ApplicationRecord
    has_many :articles, dependent: :destroy

    validates :name, presence: true, uniqueness: true

    def total_articles
        articles.count
    end
end
