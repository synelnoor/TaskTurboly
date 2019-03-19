class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :status
      t.date :created_date
      t.date :due_date
      t.integer :user_id
      t.integer :created_by
      #t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
