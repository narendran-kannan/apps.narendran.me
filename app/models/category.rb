class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :slug, presence: true
  before_validation :set_slug, on: %i[create update]
  has_and_belongs_to_many :blogs
  def set_slug
    self.slug = self.name.parameterize unless self.name.blank?
  end
end
