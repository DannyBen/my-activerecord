class Schema < ActiveRecord::Migration[6.1]
  def change
    create_table :users, force: true do |t|
      t.string :name
    end
  end
end