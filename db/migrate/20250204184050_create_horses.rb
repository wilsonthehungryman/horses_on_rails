class CreateHorses < ActiveRecord::Migration[8.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.references :breed, null: false, foreign_key: true
      t.integer :age
      t.integer :number_of_legs
      t.decimal :top_speed

      t.timestamps
    end
  end
end
