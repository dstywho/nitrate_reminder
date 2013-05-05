ReportDefinition.all.each do |definition|
  report = definition.reports.new
  report.save
  report.get_latest_test_cases
  ReportMailer.report(report).deliver
end
