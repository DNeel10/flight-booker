class ApplicationMailer < ActionMailer::Base
  default from: "do_not_reply@flightbooker.test"
  layout "mailer"
end
