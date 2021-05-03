class AddAdminRole < ActiveRecord::Migration[6.0]
  def self.up
    Role.create({ name: 'Admin', privileges: 0 })
    Role.create({ name: 'Basic', privileges: 1 })
  end
end
