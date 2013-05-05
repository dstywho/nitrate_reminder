class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :report_definition

      t.timestamps
    end
  end
end
