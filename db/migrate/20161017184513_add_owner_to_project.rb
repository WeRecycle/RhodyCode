class AddOwnerToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :owner_id, :integer
  end
end
