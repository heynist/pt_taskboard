class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :iteration_d
      t.string :story_type
      t.string :name

      t.timestamps
    end
  end
end
