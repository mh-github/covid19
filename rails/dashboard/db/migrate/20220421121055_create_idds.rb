class CreateIdds < ActiveRecord::Migration[7.0]
  def change
    create_table :india_daily_delta do |t|
      t.datetime :date
      t.string   :place
      t.integer  :confirmed
      t.integer  :deaths
      t.integer  :recovered
      t.timestamps
    end
  end
end
