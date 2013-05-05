class CreateTestPlans < ActiveRecord::Migration
  def change
    create_table :test_plans do |t|
      t.integer :external_id
      t.string :name

      t.timestamps
    end
  end
end
