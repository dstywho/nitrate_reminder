require 'tcms'

class MyValidator < ActiveModel::Validator
  def validate(record)
    testplan = nil
    begin 
      testplan = Tcms.new.test_plan(record.external_id) 
    rescue Exception => e
      record.errors[:external_id] << e.message
      return
    end
    record.errors[:external_id] << "test case does not exist" if testplan.nil? || (testplan['args'] &&  testplan['args'].include?('does not exist'))
  end
end

class TestPlan < ActiveRecord::Base

  validates :external_id, :presence => true, :uniqueness => true
  validates :name, :presence => true
  attr_accessible :external_id, :name
  has_many :report_definitions, :through => :report_definition_test_plan 
  before_save :fetch_from_tcms
  
  include ActiveModel::Validations
  validates_with MyValidator

  def fetch_from_tcms
    testplan = Tcms.new.test_plan(self.external_id)
    self.name =  testplan['name']
  end
end
