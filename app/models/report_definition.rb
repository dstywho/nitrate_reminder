class ReportDefinition < ActiveRecord::Base
  attr_accessible :name
  has_many :reports
  has_many :test_plans, :through => :report_definition_test_plan 
end
