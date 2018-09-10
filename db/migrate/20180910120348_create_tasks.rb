class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.belongs_to :list, index: true

      t.string :title
      t.text  :description
      t.date :date
      t.boolean :status
      
      t.timestamps
    end
  end
end
