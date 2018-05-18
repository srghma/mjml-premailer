class ExampleMailer < ActionMailer::Base
  default from: "from@example.com"

  layout 'mail'

  def test_message
    mail to: 'to@example.org', subject: 'Test Message'
  end
end
