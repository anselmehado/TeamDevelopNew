class AddTitleToLabels < ActiveRecord::Migration[5.2]
  def change
    add_column :labels, :title, :string
  end
end
