class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :route

      t.timestamps
    end
    add_index :comments, :route_id
  end
end
