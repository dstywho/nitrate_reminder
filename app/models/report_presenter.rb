class ReportPresenter
  def initialize(report)
    @report = report
  end

  def display_diff
    result = ""
    @report.status_diff.each do |status,count_diff|
      result += "#{status}: #{count_diff[:count]} (#{count_diff[:diff]})\n"
    end
    result
  end

end
