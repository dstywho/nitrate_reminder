class ReportMailer < ActionMailer::Base
  default from: "dontemailmebot@redhat.com"

  def report(report)
    @report = ReportPresenter.new(report)
    mail(:to => 'dstywho@gmail.com', :subject =>"TCMS Test Case Review Reminder")
  end

end
