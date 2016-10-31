class CreateProjectsTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :projects, :tags do |t|
      t.index :project_id
      t.index :tag_id
    end
  end
end
