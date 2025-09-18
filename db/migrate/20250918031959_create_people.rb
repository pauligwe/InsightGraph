class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :role
      t.jsonb :metadata

      t.timestamps
    end
  end
end
