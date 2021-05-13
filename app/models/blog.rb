class Blog < ApplicationRecord
  has_rich_text :content
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: true }
  has_and_belongs_to_many :categories
  has_one_attached :featured_image
  before_validation :set_slug, on: %i[create update]

  def truncated_content
    content.to_plain_text.squish.truncate(50)
  end

  def set_slug
    return unless slug.blank?

    self.slug = title.parameterize
  end
end
