class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :status
      t.jsonb :metadata

      t.timestamps
    end
  end
end
