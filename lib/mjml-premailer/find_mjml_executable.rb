require "mkmf"

class MjmlPremailer
  module FindMjmlExecutable
    extend self

    def find_mjml_executable
      local_path = File.expand_path("node_modules/.bin/mjml", Dir.pwd)
      return local_path if File.file?(local_path)

      find_executable("mjml")
    end
  end
end
