module ReportsHelper
  def display_test_case_count_by_status(counts)
    result = ""
    counts.each do |status,count|
      result += "#{status}: #{count} "
    end
    result
  end

  def display_diff(diff)
    result = ""
    diff.each do |status,count_diff|
      result += "#{status}: #{count_diff[:count]} (#{count_diff[:diff]})"
    end
    result
  end
end
