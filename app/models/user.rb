class User < ApplicationRecord
  has_secure_password

  attr_accessor :add_admin

  has_many :user_roles, class_name: 'UserRole'
  has_many :roles, through: :user_roles


  before_save { self.email = email.downcase }
  after_save :assign_role

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  def admin?
    true unless roles.detect { |x| x.name == 'Admin' }.nil?
  end

  def assign_role
    user_roles.create(role_id: Role.all.detect { |x| x.name = 'Basic' }&.id) and return unless add_admin

    user_roles.create(role_id: Role.all.detect { |x| x.name = 'Admin' }&.id)
  end
end
