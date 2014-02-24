class ReminderMailer < ActionMailer::Base
  default from: "from@example.com", subject: "Reminder: GSD!"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reminder_mailer.reminder.subject
  #
  def reminder(user)
    @user = user
    @list = Todo.find_todays(user)
    @overdue = Todo.find_overdues(user)

    # This has to be the last line
    mail to: user.email
  end
end
