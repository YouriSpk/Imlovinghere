class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.datetime :sent_at
      t.references :sender, null: false, foreign_key: { to_table: :users }  # Lien correct vers la table users
      t.references :conversation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
