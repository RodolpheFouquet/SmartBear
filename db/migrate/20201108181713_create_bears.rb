class CreateBears < ActiveRecord::Migration[6.0]
  def change
    create_table :bears do |t|
      t.references :bear_list, null: false, foreign_key: true
      t.string :colour
      t.string :name
      t.string :portrait

      t.timestamps
    end
  end
end
