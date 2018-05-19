# mjml-premailer

Write your emails using [mjml framework](https://mjml.io) on rails, using any template language supported by Rails

[![Travis](https://travis-ci.org/srghma/mjml-premailer.svg?branch=master)](https://travis-ci.org/srghma/mjml-premailer)
[![Gem Version](https://badge.fury.io/rb/mjml-premailer.svg)](https://badge.fury.io/rb/mjml-premailer)
[![Maintainability](https://api.codeclimate.com/v1/badges/87ecd26fdfceb00dacb6/maintainability)](https://codeclimate.com/github/srghma/mjml-premailer/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/srghma/mjml-premailer/badge.svg?branch=master)](https://coveralls.io/github/srghma/mjml-premailer?branch=master)

## How it works
This gem will processes html part of your mail using `mjml` cli before delivery using rails ActionMailer hook

Or you can process it yourself using

```ruby
MjmlPremailer::Hook.perform(mail)
```

## Installation

Install `mjml` npm package (v4) globally

```sh
$ npm install -g mjml@^4.0
```

or locally

```sh
$ npm install --save-dev mjml@^4.0
```

Add the gem to your `Gemfile`:

```ruby
gem 'mjml-premailer'
```

## Configuration options

In `/config/initializers/mjml_premailer.rb`

```ruby
MjmlPremailer.config.merge!(
  bin:              ...,   # by default bin path is found authomatically, but you can specify it here
  debug:            false, # true/false
  beautify:         true,  # true/false
  minify:           false, # true/false
  keep_comments:    false, # true/false
  validation_level: :skip  # :strict/:soft/:skip
)
```

More about options [here](https://mjml.io/documentation/#command-line-interface)

## Usage

```erb
<!-- app/views/layouts/mailer.html.erb -->

<mjml>
  <mj-body>
    <%= yield %>
  <mj-body>
</mjml>
```


```erb
<!-- app/views/welcome_mailer/welcome.html.erb -->

<mj-text>Hello, <%= @user.name %></mj-text>

```

```rb
class WelcomeMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome')
  end
end
```

Example rails project you can find [here](example)

Mjml documentation is [here](https://mjml.io/documentation)


## Difference from other gems

[sighmon/mjml-rails](https://github.com/sighmon/mjml-rails):
- outdated
- work on hacks
- no support for `/app/views/layouts`

[kolybasov/mjml-ruby](https://github.com/kolybasov/mjml-ruby/):
- best gem I found, this gem is based on it, thanks [kolybasov](https://github.com/kolybasov) for his work
- doesnt support mjml v4 (at time of writing)
- doesnt support template languages other then erb (at least I didnt managed)
