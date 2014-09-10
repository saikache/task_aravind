class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :ad_id
      t.string :avatar

      t.timestamps
    end
  end
end
