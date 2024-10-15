class AddImageUrlToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :image_url, :string
  end
end
