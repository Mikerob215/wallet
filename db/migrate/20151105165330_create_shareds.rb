class CreateShareds < ActiveRecord::Migration
  def change
    create_table :shareds do |t|
      t.belongs_to :user, index: true
      t.belongs_to :card, index: true

      t.timestamps null: false
    end
  end
end
