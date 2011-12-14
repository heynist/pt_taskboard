class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :nr
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
