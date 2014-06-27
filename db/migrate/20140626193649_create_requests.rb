class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|

	    t.string :title
	    t.string :description

	    t.timestamps

    end
  end
end
