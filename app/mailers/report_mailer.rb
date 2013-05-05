class ReportMailer < ActionMailer::Base
  default from: "dontemailmebot@redhat.com"

  def report(report)
    @report = ReportPresenter.new(report)
    mail(:to => report.report_definition.emails.split(/\s*,\s*/), :subject =>"TCMS Test Case Review Reminder")
  end

end
