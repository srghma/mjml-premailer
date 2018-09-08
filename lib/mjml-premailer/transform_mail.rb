class MjmlPremailer
  module TransformMail
    extend self

    def transform_mail(mail)
      mail.tap do
        html_part = mail.html_part || mail
        html = html_part.body.to_s

        MjmlPremailer::Debug.debug '> MjmlPremailer template:'
        MjmlPremailer::Debug.debug html

        parsed_html, error = MjmlPremailer::TransformHtml.transform_html(html)

        raise error if error

        MjmlPremailer::Debug.debug '> MjmlPremailer parsed template:'
        MjmlPremailer::Debug.debug parsed_html

        html_part.body = parsed_html
      end
    end
  end
end
