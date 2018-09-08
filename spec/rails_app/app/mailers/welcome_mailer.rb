class WelcomeMailer < ApplicationMailer
  def welcome_email(greeting)
    @greeting = greeting

    mjml_mail(to: 'example@example.com')
  end
end
