class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.text :url
      t.integer :counter

      t.timestamps
    end
  end
end
