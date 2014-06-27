class AddFileInfoToPictures < ActiveRecord::Migration
	def change
		add_column :pictures, :image_file_name, :string
		add_column :pictures, :image_content_type, :string
		add_column :pictures, :image_file_size, :integer

	end
end
