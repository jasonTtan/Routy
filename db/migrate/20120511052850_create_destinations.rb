class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :destID
      t.references :route

      t.timestamps
    end
    add_index :destinations, :route_id
  end
end
