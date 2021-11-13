class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :external_url
      t.string :token
      t.integer :visits_count
      t.index :token

      t.timestamps
    end
  end
end
