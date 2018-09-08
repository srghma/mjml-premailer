require 'open3'

class MjmlPremailer
  module TransformHtml
    extend self

    def transform_html(html_body)
      bin = MjmlPremailer.config[:bin]

      beautify = MjmlPremailer.config[:beautify]
      beautify_option = "--config.beautify #{beautify}"

      minify = MjmlPremailer.config[:minify]
      minify_option = "--config.minify #{minify}"

      keep_comments = MjmlPremailer.config[:keep_comments]
      keep_comments_option = "--config.keepComments #{keep_comments}"

      validation_level = MjmlPremailer.config[:validation_level]
      validation_level_option = "--config.validationLevel #{validation_level}"

      read_input_to_stdin_option = '-i'

      # stolen from https://github.com/kolybasov/mjml-ruby/blob/master/lib/mjml/parser.rb
      should_get_outpout_from_file = html_body.size > 20_000

      if should_get_outpout_from_file
        temp_file = Tempfile.new

        write_output_to_tempfile_option = "-o #{temp_file.path}"

        cmd = [
          bin,
          read_input_to_stdin_option,
          write_output_to_tempfile_option,
          beautify_option,
          minify_option,
          keep_comments_option,
          validation_level_option
        ].join(' ')

        _out, err, _sts = Open3.capture3(cmd, stdin_data: html_body)

        temp_file.rewind
        temp_file.unlink

        err_ = err.strip.presence

        [temp_file.read, err_]
      else
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

        MjmlPremailer::Debug.debug "> MjmlPremailer command: #{cmd}"

        out, err, _sts = Open3.capture3(cmd, stdin_data: html_body)

        err_ = err.strip.presence

        [out, err_]
      end
    end
  end
end
