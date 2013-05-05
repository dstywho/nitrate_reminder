class ReportDefinition < ActiveRecord::Base
  attr_accessible :name
  has_many :reports
  has_many :report_definition_test_plans 
  has_many :test_plans, :through => :report_definition_test_plans 
end
