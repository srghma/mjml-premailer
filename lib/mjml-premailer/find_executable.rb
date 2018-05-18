class MjmlPremailer
  module FindExecutable
    extend self

    def find_executable
      local_path = File.expand_path('node_modules/.bin/mjml', Dir.pwd)
      return local_path if File.file?(local_path)
      `/usr/bin/env bash -c "which mjml"`.strip
    end
  end
end
