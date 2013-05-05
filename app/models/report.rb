class Report < ActiveRecord::Base
  has_many :test_cases
  belongs_to :report_definition
  attr_accessible :report_definition_id, :report_definition
  #

  def get_latest_test_cases
    report_definition.test_plans.each do |test_plan|
       _get_latest_test_cases(test_plan) 
    end
  end

  def _get_latest_test_cases(plan)
    tcms = Tcms.new
    _testcases = tcms.get_test_cases('7332')
    _testcases.each do |testcase|
        TestCase.create(summary: testcase['summary'], author: testcase['author'], case_id: testcase['case_id'], status: testcase['case_status'], report: self)
    end
  end

  def test_cases_count_by_status
    test_cases.group('status').count
  end

  def test_cases_that_need_review_count_by_status
    test_cases.need_review.group('status').count
  end

  def previous_report
    Report.where('created_at < ?', self.created_at).order('created_at desc').first
  end

  def status_diff
    my_status_diff(:test_cases_count_by_status)
  end

  def status_diff_non_final
    my_status_diff(:test_cases_that_need_review_count_by_status)
  end

  def _poo
    'hi'
  end

  def my_status_diff(method_name)
      prev = previous_report ? previous_report.send(method_name) : nil
      current = self.send(method_name)
      result = {}
      current.each do |status, count|
        diff = prev ? prev[status].to_i - count.to_i : 0
        result[status] = {count: count, diff: diff}
      end
     result 
  end
end
