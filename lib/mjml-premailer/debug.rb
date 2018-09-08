class MjmlPremailer
  module Debug
    extend self

    def debug(str)
      puts str if MjmlPremailer.config[:debug]
    end
  end
end
