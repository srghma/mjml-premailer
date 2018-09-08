require 'mjml-premailer/version'
require 'mjml-premailer/debug'
require 'mjml-premailer/find_executable'

require 'mjml-premailer/transform_html'
require 'mjml-premailer/transform_mail'

require 'mjml-premailer/mjml_mail'

class MjmlPremailer
  # from https://github.com/kolybasov/mjml-ruby/blob/master/lib/mjml.rb#L33
  @config = {
    bin:              MjmlPremailer::FindExecutable.find_executable,
    debug:            false,
    beautify:         true,
    minify:           false,
    keep_comments:    false,
    validation_level: :skip # :strict/:soft/:skip
  }

  class << self
    attr_accessor :config
  end
end
