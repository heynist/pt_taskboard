class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :email
      t.string :initials
      t.integer :project_id

      t.timestamps
    end
  end

end
