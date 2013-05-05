class CreateReportDefinitionTestPlans < ActiveRecord::Migration
  def change
    create_table :report_definition_test_plans do |t|
      t.references :report_definition
      t.references :test_plan

      t.timestamps
    end
    add_index :report_definition_test_plans, :report_definition_id
    add_index :report_definition_test_plans, :test_plan_id
  end
end
