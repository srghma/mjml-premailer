class MjmlPremailer
  class Railtie < ::Rails::Railtie
    config.after_initialize do
      ::MjmlPremailer.register_interceptors
    end
  end
end
