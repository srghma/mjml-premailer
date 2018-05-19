source 'https://rubygems.org'

gemspec

rails_version = ENV.fetch('RAILS_VERSION', '5')

if rails_version == 'master'
  git 'git://github.com/rails/rails.git' do
    gem 'rails'
  end
  gem 'arel', github: 'rails/arel'
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
else
  gem 'rails', "~> #{rails_version}"
end
