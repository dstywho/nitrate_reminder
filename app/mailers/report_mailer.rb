class ReportMailer < ActionMailer::Base
  default from: "dontemailmeback@redhat.com"

  def send_report(report)
    mail(:to => dstywho@gmail.com, :subject =>"")
  end
end
