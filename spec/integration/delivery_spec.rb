require 'spec_helper'

describe 'ActionMailer::Base delivery' do
  it 'delivers email with inlined CSS' do
    custom_greeting = 'Custom greeting'
    WelcomeMailer.welcome_email(custom_greeting).deliver_now

    mail = ActionMailer::Base.deliveries.last
    expect(mail).to be_present

    html_part = mail.html_part || mail
    html = html_part.body.to_s

    expect(html).to be_present

    # expect(html).to start_with?('<!doctype')
    expect(html).to include(custom_greeting)
    expect(html).to include(%(Hello from test_message outside block))
    expect(html).to include(%(Hello from test_message inside block))
    expect(html).to include(%(Hello from wrapper))
    expect(html).to include(%(Hello from layout))

    expect(html).not_to include(%(mj-text))
  end
end
