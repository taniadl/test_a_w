class AddReferenceToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :user, :referenes
  end
end
