class AddProfileIdToGallery < ActiveRecord::Migration
  def change
	  add_column :galleries, :profile_id, :integer
  end
end
