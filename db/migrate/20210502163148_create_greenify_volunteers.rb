class CreateGreenifyVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :greenify_volunteers do |t|
      t.string :name
      t.string :mobile
      t.string :mcode
      t.string :mail
      t.integer :status

      t.timestamps
    end

    add_index :greenify_volunteers, [:mail], unique: true
  end
end
