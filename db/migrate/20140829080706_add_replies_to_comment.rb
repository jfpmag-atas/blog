class AddRepliesToComment < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
  		t.references :reply_to
  	end
  end
end
