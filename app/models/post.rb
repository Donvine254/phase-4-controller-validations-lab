class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 100 }
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
end
