class CreateUsersTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :tags do |t|
      t.index :user_id
      t.index :tag_id
    end
  end
end
