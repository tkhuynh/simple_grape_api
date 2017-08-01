class CreateEmps < ActiveRecord::Migration
  def change
    create_table :emps do |t|
      t.string :name
      t.string :sport
      t.integer :age

      t.timestamps null: false
    end
  end
end
