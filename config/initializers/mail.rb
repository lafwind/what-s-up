ActionMailer::Base.smtp_settings = {
  address: 'smtp.mandrillapp.com',
  port: 587,
  enable_starttls_auto: true,
  user_name: 'lafwind@gmail.com',
  password: 'WcCQU2igpI9IIwnUPp6RmQ',
  authentication: 'login'
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'
