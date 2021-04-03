class CreateWbCanvas < ActiveRecord::Migration[6.0]
  def change
    create_table :wb_canvas do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :img_data, null: true
      t.timestamps

    end
  end
end
