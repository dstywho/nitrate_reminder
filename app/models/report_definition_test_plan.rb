class ReportDefinitionTestPlan < ActiveRecord::Base
  belongs_to :report_definition
  belongs_to :test_plan
  # attr_accessible :title, :body
end
