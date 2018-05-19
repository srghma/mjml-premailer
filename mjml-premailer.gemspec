$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'mjml-premailer/version'

Gem::Specification.new do |s|
  s.name        = 'mjml-premailer'
  s.version     = MjmlPremailer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'Apache-2.0'
  s.authors     = ['Sergey Homa']
  s.email       = ['srghma@gmail.com']
  s.homepage    = 'https://github.com/srghma/mjml-premailer'
  s.summary     = 'Write your emails using mjml framework'
  s.description = 'This gem will processes html part of your mail using `mjml` cli before delivery using rails ActionMailer hook'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {example,spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'actionmailer'

  s.add_development_dependency 'coveralls' if RUBY_ENGINE == 'ruby'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 3.3'
end
