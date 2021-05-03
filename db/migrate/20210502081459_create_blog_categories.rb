class CreateBlogCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_categories do |t|
      t.references :category
      t.references :blog

      t.foreign_key :categories, column: :category_id
      t.foreign_key :blogs, column: :blog_id
      t.timestamps
    end
  end
end
