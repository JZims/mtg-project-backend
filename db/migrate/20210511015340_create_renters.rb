class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :name
  end
end
end
