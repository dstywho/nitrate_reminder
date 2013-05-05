class Report < ActiveRecord::Base
  has_many :test_cases
  belongs_to :report_definition
  attr_accessible :report_definition_id, :report_definition

  def test_cases_complete_in_last_week
    test_cases_complete_since(created_at - 7.days)
  end

  def test_cases_complete_since(starttime)
    initials = first_non_final_testcase_in_history(starttime)
    current_confirmed_testcases( initials.map(&:case_id) )
  end

  def test_cases_created_in_last_week
    test_cases_created_since(created_at - 7.days)
  end

  def test_cases_created_since(starttime)
    first_non_final_testcase_in_history.having('min(test_cases.created_at) >= ?', starttime).all
  end

  def velocity_in_days
    return velocity * 24 * 60 * 60 
  end

  def velocity_in_weeks
    return velocity * 604800
  end

  #num_tcs/seconds
  def velocity
    num_test_cases_finalized = 0 #seconds
    total_time_elapsed = 0
    initials = first_non_final_testcase_in_history
    currents = current_confirmed_testcases( initials.map(&:case_id) )
    currents.each do |current_test_case|
      initial_test_case  = initials.find{|t| t.case_id = current_test_case.case_id }
      if initial_test_case
        num_test_cases_finalized += 1 
        total_time_elapsed += current_test_case.created_at - initial_test_case.created_at
      end
    end
    puts num_test_cases_finalized
    puts total_time_elapsed
    return total_time_elapsed != 0 ? (num_test_cases_finalized / total_time_elapsed ) :  num_test_cases_finalized
  end

  def current_confirmed_testcases(case_ids)
    test_cases.where('case_id in (?) and status = ?', case_ids, "CONFIRMED")
  end

  def first_non_final_testcase_in_history(limit_date = Time.now - 1.years)
    TestCase.joins(:report => :report_definition)
      .select("case_id, min(test_cases.created_at), test_cases.created_at")
      .group(:case_id)
      .where('status <> ? and report_definition_id = ? and test_cases.created_at > ?', 'CONFIRMED', report_definition_id, limit_date)
  end


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
    Report.where('report_definition_id = ? and created_at < ?', report_definition.id, self.created_at).order('created_at desc').first
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
        diff = prev ? count.to_i - prev[status].to_i : 0
        result[status] = {count: count, diff: diff}
      end
     result 
  end
end
