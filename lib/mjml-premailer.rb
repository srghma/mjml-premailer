require 'action_mailer'

require 'mjml-premailer/version'
require 'mjml-premailer/hook'
require 'mjml-premailer/find_executable'

class MjmlPremailer
  # from https://github.com/kolybasov/mjml-ruby/blob/master/lib/mjml.rb#L33
  @config = {
    debug:            true,
    bin:              MjmlPremailer::FindExecutable.find_executable,
    beautify:         true,
    minify:           false,
    keep_comments:    false,
    validation_level: :skip # 'strict', 'soft', 'skip'
  }

  class << self
    attr_accessor :config
  end

  def self.register_interceptors
    ActionMailer::Base.register_interceptor(MjmlPremailer::Hook)

    if ActionMailer::Base.respond_to?(:register_preview_interceptor)
      ActionMailer::Base.register_preview_interceptor(MjmlPremailer::Hook)
    end
  end
end

require 'mjml-premailer/railtie' if defined?(Rails)
