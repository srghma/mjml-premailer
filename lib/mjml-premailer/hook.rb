require 'open3'

class MjmlPremailer
  module Hook
    extend self

    def perform(mail)
      html_part = mail.html_part || mail
      html = html_part.body.to_s

      debug '> MjmlPremailer template:'
      debug html

      parsed_html, error = parse(html)

      error_ = error.strip.presence

      raise error_ if error_

      debug '> MjmlPremailer parsed template:'
      debug parsed_html

      html_part.body = parsed_html
    end

    alias delivering_email perform
    alias previewing_email perform

    private

    def parse(html_body)
      bin              = MjmlPremailer.config[:bin]

      beautify         = MjmlPremailer.config[:beautify]
      beautify_option = "--config.beautify #{beautify}"

      minify = MjmlPremailer.config[:minify]
      minify_option = "--config.minify #{minify}"

      keep_comments = MjmlPremailer.config[:keep_comments]
      keep_comments_option = "--config.keepComments #{keep_comments}"

      validation_level = MjmlPremailer.config[:validation_level]
      validation_level_option = "--config.validationLevel #{validation_level}"

      read_input_to_stdin_option = '-i'
      write_output_to_stdout_option = '-s'

      cmd = [
        bin,
        read_input_to_stdin_option,
        write_output_to_stdout_option,
        beautify_option,
        minify_option,
        keep_comments_option,
        validation_level_option
      ].join(' ')

      debug "> MjmlPremailer command: #{cmd}"

      out, err, _sts = Open3.capture3(cmd, stdin_data: html_body)

      [out, err]
    end

    def debug(str)
      puts str if MjmlPremailer.config[:debug]
    end
  end
end
