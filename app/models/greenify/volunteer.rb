class Greenify::Volunteer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :mobile, presence: true, format: { with: /\A\d+\Z/ }, uniqueness:  {case_sensitive: false}
  validates :name, presence: true, length: {maximum: 25}
  attr_accessor :skip_verification

  before_save :add_status

  STATUS = {
    verified: 1,
    not_verified: 0,
    pending: 2
  }.freeze

  def add_status
    self.status = STATUS[:verified] and return if skip_verification

    self.status = STATUS[:not_verified]
  end
end
