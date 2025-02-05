class AddHabtmTables < ActiveRecord::Migration[8.0]
  def change
    create_join_table :interests, :users
    create_join_table :skils, :users
  end
end
