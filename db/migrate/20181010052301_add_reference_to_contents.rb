class AddReferenceToContents < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :project, foreign_key: true
  end
end
