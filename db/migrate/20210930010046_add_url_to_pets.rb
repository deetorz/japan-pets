class AddUrlToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :url, :string
  end
end
