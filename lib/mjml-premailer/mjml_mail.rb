class MjmlPremailer
  module MjmlMail
    def mjml_mail(*args, **kargs, &block)
      this_mail = mail(*args, **kargs, &block)

      MjmlPremailer::TransformMail.transform_mail(this_mail)
    end
  end
end
