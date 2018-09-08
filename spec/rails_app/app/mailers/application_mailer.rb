class ApplicationMailer < ActionMailer::Base
  include MjmlPremailer::MjmlMail

  default from: 'from@example.com'
  layout 'mail'
end
