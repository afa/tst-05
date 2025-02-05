class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, index: true, index: true, null: false
      t.string :name
      t.string :surname
      t.string :patronymic
      t.integer :age
      t.string :nationality
      t.string :country
      t.string :gender
      t.string :full_name
    end
  end
end
