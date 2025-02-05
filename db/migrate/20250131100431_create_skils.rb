class CreateSkils < ActiveRecord::Migration[8.0]
  def change
    create_table :skils do |t|
      t.string :name, null: false
      t.index [:name], unique: true
    end
  end
end
