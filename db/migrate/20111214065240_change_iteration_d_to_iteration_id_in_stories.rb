class ChangeIterationDToIterationIdInStories < ActiveRecord::Migration
  def change
    rename_column :stories, :iteration_d, :iteration_id
  end
end
