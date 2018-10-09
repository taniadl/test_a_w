class RemoveThumbnailFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :thumbnail, :string
  end
end
