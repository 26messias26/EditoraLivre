class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :titulo
      t.text :descricao
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
