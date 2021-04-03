class WbCanva < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_validation :generate_name,  on: :create

  def generate_name
    (0..4).map { |_| rand(65..90).chr }.join
  end
end
