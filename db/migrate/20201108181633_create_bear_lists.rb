class CreateBearLists < ActiveRecord::Migration[6.0]
  def change
    create_table :bear_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
