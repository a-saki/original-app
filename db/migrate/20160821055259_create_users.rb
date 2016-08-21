class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :family_id
      t.string :name
      t.string :age
      t.string :gender
      t.string :relationship

      t.timestamps null: false
      t.index [:family_id]
    end
  end
end
