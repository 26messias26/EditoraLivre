class CreateAmigos < ActiveRecord::Migration[7.0]
  def change
    create_table :amigos do |t|
      t.integer :user_id
      t.integer :amigo

      t.timestamps
    end
  end
end
