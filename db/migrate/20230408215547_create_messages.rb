class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true
      t.string :body, null: false
      t.integer :likes_count, null: false, default: 0

      t.timestamps
    end

    add_index :messages, :created_at
  end
end
