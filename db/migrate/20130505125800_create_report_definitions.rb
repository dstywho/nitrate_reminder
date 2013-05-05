class CreateReportDefinitions < ActiveRecord::Migration
  def change
    create_table :report_definitions do |t|
      t.string :name
      t.string :emails

      t.timestamps
    end
  end
end
