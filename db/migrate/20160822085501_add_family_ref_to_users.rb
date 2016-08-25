class AddFamilyRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :family, index: true, foreign_key: true
  end
end
