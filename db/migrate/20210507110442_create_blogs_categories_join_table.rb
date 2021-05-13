class CreateBlogsCategoriesJoinTable < ActiveRecord::Migration[6.0]
  def self.up
    drop_table :blog_categories
    create_join_table :blogs, :categories
  end
end
