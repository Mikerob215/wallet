class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :kind
      t.string :expmonth
      t.string :expyear
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
