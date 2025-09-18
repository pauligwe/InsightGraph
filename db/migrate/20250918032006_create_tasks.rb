class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.date :due_date
      t.jsonb :metadata
      t.references :project, null: false, foreign_key: true
      t.references :assignee, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
