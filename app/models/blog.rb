class Blog < ApplicationRecord
  has_rich_text :content
  has_many :blog_categories, class_name: 'BlogCategory'
  has_many :categories, through: :blog_categories
end
