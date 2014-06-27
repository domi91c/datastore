class AddAttachmentImageToPictures < ActiveRecord::Migration
	def change
		change_table :pictures do |t|
			t.attachment :image
		end
		drop_attached_file :pictures, :image

	end
end
