class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :points

      t.timestamps
    end
  end
end
