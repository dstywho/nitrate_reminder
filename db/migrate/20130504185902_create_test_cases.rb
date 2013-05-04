class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.integer :case_id
      t.string :summary
      t.string :author
      t.string :status
      t.references :report

      t.timestamps
    end
    add_index :test_cases, :report_id
  end
end
