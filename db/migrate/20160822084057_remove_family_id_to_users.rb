class RemoveFamilyIdToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :family_id, :string
  end
end
