class CreateTweets < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :content, :null => false
  		t.references :user
  		t.timestamps
  	end
  end
end
