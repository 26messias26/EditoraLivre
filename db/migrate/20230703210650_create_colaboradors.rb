class CreateColaboradors < ActiveRecord::Migration[7.0]
  def change
    create_table :colaboradors do |t|
      t.integer :user_id
      t.integer :publication_id

      t.timestamps
    end
  end
end
