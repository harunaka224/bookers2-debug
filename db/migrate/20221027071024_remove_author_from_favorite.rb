class RemoveAuthorFromFavorite < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :post_image_id, :string
  end
end
