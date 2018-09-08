class MjmlPremailer
  module MjmlMail
    def mjml_mail(*args, **kargs)
      this_mail = mail(*args, **kargs)

      MjmlPremailer::TransformMail.transform_mail(this_mail)
    end
  end
end
