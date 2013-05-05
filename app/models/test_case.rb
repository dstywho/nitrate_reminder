class TestCase < ActiveRecord::Base
  belongs_to :report
  attr_accessible :author, :case_id, :status, :summary, :report
end
